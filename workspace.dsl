workspace {
    
    !docs docs 

    model {

        !include include/knowledgeBase.dsl
        !include include/system.dsl

        person = person "Проектировщик" "Аналитик, архитектор или любой другой член команды"
        user = person "Пользователь" "Любой из команды или вне, у кого есть доступ к рабочему пространству в Confluence"
        
        person -> git "Pull/commit/push" 
        person -> visualStudio "Рабочий проект"
        visualStudio -> localRepository "Рабочая директория с локальным проектом"
        visualStudio -> renderingSystem "Рендериг документации"
        system -> confluence "Документация"
        user -> confluenceWebApp "Чтение документации"
        confluence -> confluenceDB "База знаний"
        foliant -> git "Pull"
        git -> mdModel
        git -> dslModel
        pipeline -> structurizrServer "Build images"
        pipeline -> foliant "Build docs"
        foliant -> confluence "Апдейт базы знаний"
    }

    views {

        systemLandscape "SystemLandscape" "Обзор ландшафта системы" {
            include *
            autoLayout
        }

        systemContext system "SystemContext" "Контекст системы автодокументирования" {
            include *
            autoLayout
        }

        container system "Containers" "Description" {
            include *
            autoLayout
        }

        component vcs {
            include *
            autoLayout
        }

        component repo "Repository" {
            include *
            autoLayout
        }

        component renderingSystem "RenderingSystem" "Рендеринг документации" {
            include *
            autoLayout
        }

        systemContext knowledgeBase "KnowledgeBase" "Контекст системы базы знаний"{
            include *
            autoLayout
        }

        container knowledgeBase "Confluence" {
            include *
            autoLayout
        }

        component builder "Pipeline" {
            include *
            autoLayout
        }

        component docsBuilder "DocsBuilder" {
            include *
            autoLayout
        }

        component confluenceWebApp "confluenceWebApp" {
            include *
            autoLayout
        }

        styles {
            element "Software System" {
                background #1168bd
                color #ffffff
            }

            element "Person" {
                shape person
                background #08427b
                color #ffffff
            }

            element "Web app" {
                shape WebBrowser
            }

            element "pipe" {
                shape Pipe
            }
            
        }
        
    }
}