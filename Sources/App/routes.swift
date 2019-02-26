import Vapor
import FluentSQLite

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    
    // POST Example
    router.post(Dish.self, at: "api/addDishes") { request, dish -> Future<Dish> in
        return dish.save(on: request)
    }
    
    // GET Example
    router.get("api/dishes") { request -> Future<[Dish]> in
        return Dish.query(on: request).all()
    }
    
    //GET by id Example
    router.get("api/dishes", Dish.parameter) {  request -> Future<Dish> in
        return try request.parameters.next(Dish.self)
    }
    
    // DELETE Example
    router.delete("api/dishes", Dish.parameter) {  request -> Future<Dish> in
        return try request.parameters.next(Dish.self).delete(on: request)
    }
}
