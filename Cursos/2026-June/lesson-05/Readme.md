# Lesson 05 - 26 of June of 2026

# Summary

* Custom Process Creation (Inherited Process)
  * Define new type of work item
    * Portfolio backlogs
      * Requirement backlog
        * Iteration backlog
    * Other work item types
  * Define new Fields for each wotk item type
  * Rule Definition
    * Make fields mandatory under conditions
    * Define fields relation conditions
* Service Hook
  * Notify our custo application about Work Item Creation
  * Created an application in node js
 
---

# Alternative work Item Creation

## Work Item Creation With HTTP

* Requirementes
  * Install CURL
    * https://curl.se/windows/
  * Or use any other http requiest tool

* Test Curl
```
curl -X GET https://github.com/estebancalabria/Az-400/
```

* Personal Access Token (PAT)
  * Key to access your projects devops enviroment from an external app

* Create a PAT
  * Store it in a secure location
  * It will be shown only once
  * If you loose it you have to create a new PAT

```cmd
curl -X POST -u :xxxxxxxxxxxxxxx -H "Content-Type: application/json-patch+json" -d "[{ \"op\" : \"add\", \"path\": \"/fields/System.Title\" , \"value\": \"Rest Work Item\" }]" https://dev.azure.com/4trainner/Scrum-Project-Sandbox/_apis/wit/workitems/$Task?api-version=7.1
```

* Response

```
{
   "id":26,
   "rev":1,
   "fields":{
      "System.AreaPath":"Scrum-Project-Sandbox",
      "System.TeamProject":"Scrum-Project-Sandbox",
      "System.IterationPath":"Scrum-Project-Sandbox",
      "System.WorkItemType":"Task",
      "System.State":"To Do",
      "System.Reason":"New task",
      "System.CreatedDate":"2026-06-26T10:06:18.96Z",
      "System.CreatedBy":{
         "displayName":"Esteban Calabria",
         "url":"https://spsprodcus7.vssps.visualstudio.com/A4fdd5b7b-82c2-437e-8af0-9d4324d2e5d3/_apis/Identities/e2ffdad0-2d43-67c4-9ab4-1c48b5054fbd",
         "_links":{
            "avatar":{
               "href":"https://dev.azure.com/4trainner/_apis/GraphProfile/MemberAvatars/aad.ZjZmY2I1NzUtMDVmZC03ZTYxLWI3ODAtNzhiNDVjODQxOWEz"
            }
         },
         "id":"e2ffdad0-2d43-67c4-9ab4-1c48b5054fbd",
         "uniqueName":"esteban.calabria@gmail.com",
         "imageUrl":"https://dev.azure.com/4trainner/_apis/GraphProfile/MemberAvatars/aad.ZjZmY2I1NzUtMDVmZC03ZTYxLWI3ODAtNzhiNDVjODQxOWEz",
         "descriptor":"aad.ZjZmY2I1NzUtMDVmZC03ZTYxLWI3ODAtNzhiNDVjODQxOWEz"
      },
      "System.ChangedDate":"2026-06-26T10:06:18.96Z",
      "System.ChangedBy":{
         "displayName":"Esteban Calabria",
         "url":"https://spsprodcus7.vssps.visualstudio.com/A4fdd5b7b-82c2-437e-8af0-9d4324d2e5d3/_apis/Identities/e2ffdad0-2d43-67c4-9ab4-1c48b5054fbd",
         "_links":{
            "avatar":{
               "href":"https://dev.azure.com/4trainner/_apis/GraphProfile/MemberAvatars/aad.ZjZmY2I1NzUtMDVmZC03ZTYxLWI3ODAtNzhiNDVjODQxOWEz"
            }
         },
         "id":"e2ffdad0-2d43-67c4-9ab4-1c48b5054fbd",
         "uniqueName":"esteban.calabria@gmail.com",
         "imageUrl":"https://dev.azure.com/4trainner/_apis/GraphProfile/MemberAvatars/aad.ZjZmY2I1NzUtMDVmZC03ZTYxLWI3ODAtNzhiNDVjODQxOWEz",
         "descriptor":"aad.ZjZmY2I1NzUtMDVmZC03ZTYxLWI3ODAtNzhiNDVjODQxOWEz"
      },
      "System.CommentCount":0,
      "System.Title":"Rest Work Item",
      "Microsoft.VSTS.Common.StateChangeDate":"2026-06-26T10:06:18.96Z",
      "Microsoft.VSTS.Common.Priority":2
   },
   "multilineFieldsFormat":{
      
   },
   "_links":{
      "self":{
         "href":"https://dev.azure.com/4trainner/1ade7f92-83a2-4fad-9ebe-765749bdd6d6/_apis/wit/workItems/26"
      },
      "workItemUpdates":{
         "href":"https://dev.azure.com/4trainner/1ade7f92-83a2-4fad-9ebe-765749bdd6d6/_apis/wit/workItems/26/updates"
      },
      "workItemRevisions":{
         "href":"https://dev.azure.com/4trainner/1ade7f92-83a2-4fad-9ebe-765749bdd6d6/_apis/wit/workItems/26/revisions"
      },
      "workItemComments":{
         "href":"https://dev.azure.com/4trainner/1ade7f92-83a2-4fad-9ebe-765749bdd6d6/_apis/wit/workItems/26/comments"
      },
      "html":{
         "href":"https://dev.azure.com/4trainner/1ade7f92-83a2-4fad-9ebe-765749bdd6d6/_workitems/edit/26"
      },
      "workItemType":{
         "href":"https://dev.azure.com/4trainner/1ade7f92-83a2-4fad-9ebe-765749bdd6d6/_apis/wit/workItemTypes/Task"
      },
      "fields":{
         "href":"https://dev.azure.com/4trainner/1ade7f92-83a2-4fad-9ebe-765749bdd6d6/_apis/wit/fields"
      }
   },
   "url":"https://dev.azure.com/4trainner/1ade7f92-83a2-4fad-9ebe-765749bdd6d6/_apis/wit/workItems/26"
}
```

## Create work Items with AZ command

* Requierements
  * You must have the az command installed
    * https://learn.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest

* Log in into azure

```
az login
```

* Install devops extension

```
az extension add --name azure-devops
```

* Register default organization 

```
az devops configure --defaults organization=https://dev.azure.com/4trainner project=Scrum-Project-Sandbox
```

* Creating a Work Item

```
az boards work-item create --title "Az command Work Item" --type Task
```

## Importing Work items from CSV/Excel

* Querys lets you write custom qerys to retrieve your work items with certain conditions

* Export a query as csv to have the file format

* Modify the CSV

```
Work Item Type,Title,Assigned To,State,Tags
"Task","Task Loade From CSV 1",,"To Do",
"Task","Task Loade From CSV 2",,"To Do",
```

* Go to work Items and click the "Import Work Items" button

---

# Repos, Pipelines and Artifacts

# Darshboards and Analytics
