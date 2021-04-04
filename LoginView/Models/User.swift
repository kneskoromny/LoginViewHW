//
//  User.swift
//  LoginView
//
//  Created by Кирилл Нескоромный on 02.04.2021.
//

struct User {
    let userName: String
    let password: String
    
    let person: Person
    
    static func getUserdata() -> User {
        return User(
            userName: "1",
            password: "1",
            person: Person.getPerson())
    }
}


struct Person {
    let name: String
    let surname: String
    let age: Int
    let city: String
    let image: String
    let hobbies: [Hobby]
    let photos: [Photo]
    
    static func getPerson() -> Person {
        return Person(
            name: "Кирилл",
            surname: "Нескоромный",
            age: 35,
            city: "Мурманск",
            image: "аватар",
            hobbies: Hobby.getHobbies(),
            photos: Photo.getPhotos())
    }
}

struct Hobby {
    let title: String
    let description: String
    
    static func getHobbies() -> [Hobby] {
        return [
            Hobby(
                title: "Бегать",
                description: """
                Бег для меня не просто спорт, это больше про планомерную
                подготовку и достижение целей.
                Этой весной планирую пробежать Московский Полумарафон!
                """),
            Hobby(
                title: "Учиться",
                description: """
                Учиться чему-то новому - мое настоящее хобби, это не только
                поиск себя, но и нежелание сидеть без дела. Очень рад,
                что открыл для себя программирование, очень интересно,
                хоть и не всегда сразу понятно:)
                """),
            Hobby(
                title: "Слушать музыку",
                description: """
                Не могу представить свой день без классного плейлиста в наушниках
                или нового альбома любимого исполнителя в домашнем стерео
                вечером, когда все дела уже сделаны и можно спокойно отдохнуть.
                """),
        ]
    }
    
    
}

struct Photo {
    let image: String
    let description: String
    
    static func getPhotos() -> [Photo] {
        return [
            Photo(
                image: "чупа",
                description: "Полумарафон в Карелии"),
            Photo(
                image: "лыжи",
                description: "Закрытие лыжного сезона в Мурманске"),
            Photo(
                image: "эльбрус",
                description: "Путешествие на Эльбрус")
        ]
    }
}





