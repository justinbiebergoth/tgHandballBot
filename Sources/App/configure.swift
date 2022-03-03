import Fluent
import FluentPostgresDriver
import Vapor
import telegram_vapor_bot

// configures your application
public func configure(_ app: Application) throws {
    app.http.server.configuration.hostname = "0.0.0.0"
    
    let tgApi: String = "5027403337:AAH9_kUZwEKvZAD-jJqWGG0TV5viBWoQ5Hc"
    let connection: TGConnectionPrtcl = TGLongPollingConnection()
    TGBot.configure(connection: connection, botId: tgApi, vaporClient: app.client)
    try TGBot.shared.start()
    TGBot.log.logLevel = .error
    DefaultBotHandlers.addHandlers(app: app, bot: TGBot.shared)
    // uncomment to serve files from /Public folder
    // app.middleware.use(FileMiddleware(publicDirectory: app.directory.publicDirectory))

   app.databases.use(.postgres(
        hostname: Environment.get("DATABASE_HOST") ?? "localhost",
        port: Environment.get("DATABASE_PORT").flatMap(Int.init(_:)) ?? PostgresConfiguration.ianaPortNumber,
        username: Environment.get("DATABASE_USERNAME") ?? "vapor_username",
        password: Environment.get("DATABASE_PASSWORD") ?? "vapor_password",
        database: Environment.get("DATABASE_NAME") ?? "vapor_database"
    ), as: .psql)

    //app.migrations.add(CreateTodo())
    
    app.migrations.add(EnumMigration())
    app.migrations.add(TeamMigration())
    app.migrations.add(PlaceMigration())
    app.migrations.add(EventMigration())
    app.migrations.add(PlayerMigration())
    
    app.migrations.add(EventPlayerMigration())
    
    try app.migrator.setupIfNeeded().wait()
        try app.migrator.prepareBatch().wait()
    
    // register routes
    try routes(app)
    
    try app.autoMigrate().wait()
}
