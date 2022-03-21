workspace {

    model {
        person = person "Проектировщик" "Аналитик, архитектор или любой другой член команды"
        user = person "Пользователь" "Любой из команды или вне, у кого есть доступ к рабочему пространству в Confluence"
        system = softwareSystem "Система автодокументации" "Хранение и работа с рабочей документацией" {
            vcs = container "Редактор" {
                visualStudio = component "Visual Studio Code" "Либо любой другой, подходящий"
            }
            localRepository = container "Локальный диск"
            renderingSystem = container "Рендеринг документации" {
                structurizrServer = component "Stucturizr standalone server"
            }
            repo = container "Репозитарий" {
                git = component "Git repository"
            }
            builder = container "Пайплайн" "Сборка документации" {
                pipeline = component "Сборочная джоба" "Pull, build structurizr project, build folian project"
            }
            docsBuilder = container "Сборочник документации" {
                foliant = component "Foliant"
            }
        }
        knowledgeBase = softwareSystem "База знаний" "Отображение рабочей документации" {
            confluenceWebApp = container "ConfluenceWebApp" {
                tags "Web app"
            }
            confluence = container "Confluence"
            }

        

        person -> git "Pull/commit/push" 
        person -> visualStudio "Рабочий проект"
        visualStudio -> localRepository "Рабочая директория с локальным проектом"
        renderingSystem -> visualStudio "Рендериг документации"
        system -> confluence "Документация"
        user -> confluenceWebApp "Чтение документации"
        confluenceWebApp -> confluence "База знаний"
        pipeline -> git "Pull"
        pipeline -> structurizrServer "Build images/pull"
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
        }
        
    }
}