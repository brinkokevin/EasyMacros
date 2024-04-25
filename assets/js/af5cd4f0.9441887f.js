"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[273],{3905:(e,n,t)=>{t.d(n,{Zo:()=>d,kt:()=>h});var r=t(67294);function a(e,n,t){return n in e?Object.defineProperty(e,n,{value:t,enumerable:!0,configurable:!0,writable:!0}):e[n]=t,e}function o(e,n){var t=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);n&&(r=r.filter((function(n){return Object.getOwnPropertyDescriptor(e,n).enumerable}))),t.push.apply(t,r)}return t}function i(e){for(var n=1;n<arguments.length;n++){var t=null!=arguments[n]?arguments[n]:{};n%2?o(Object(t),!0).forEach((function(n){a(e,n,t[n])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(t)):o(Object(t)).forEach((function(n){Object.defineProperty(e,n,Object.getOwnPropertyDescriptor(t,n))}))}return e}function l(e,n){if(null==e)return{};var t,r,a=function(e,n){if(null==e)return{};var t,r,a={},o=Object.keys(e);for(r=0;r<o.length;r++)t=o[r],n.indexOf(t)>=0||(a[t]=e[t]);return a}(e,n);if(Object.getOwnPropertySymbols){var o=Object.getOwnPropertySymbols(e);for(r=0;r<o.length;r++)t=o[r],n.indexOf(t)>=0||Object.prototype.propertyIsEnumerable.call(e,t)&&(a[t]=e[t])}return a}var c=r.createContext({}),s=function(e){var n=r.useContext(c),t=n;return e&&(t="function"==typeof e?e(n):i(i({},n),e)),t},d=function(e){var n=s(e.components);return r.createElement(c.Provider,{value:n},e.children)},u="mdxType",p={inlineCode:"code",wrapper:function(e){var n=e.children;return r.createElement(r.Fragment,{},n)}},m=r.forwardRef((function(e,n){var t=e.components,a=e.mdxType,o=e.originalType,c=e.parentName,d=l(e,["components","mdxType","originalType","parentName"]),u=s(t),m=a,h=u["".concat(c,".").concat(m)]||u[m]||p[m]||o;return t?r.createElement(h,i(i({ref:n},d),{},{components:t})):r.createElement(h,i({ref:n},d))}));function h(e,n){var t=arguments,a=n&&n.mdxType;if("string"==typeof e||a){var o=t.length,i=new Array(o);i[0]=m;var l={};for(var c in n)hasOwnProperty.call(n,c)&&(l[c]=n[c]);l.originalType=e,l[u]="string"==typeof e?e:a,i[1]=l;for(var s=2;s<o;s++)i[s]=t[s];return r.createElement.apply(null,i)}return r.createElement.apply(null,t)}m.displayName="MDXCreateElement"},25304:(e,n,t)=>{t.r(n),t.d(n,{assets:()=>c,contentTitle:()=>i,default:()=>p,frontMatter:()=>o,metadata:()=>l,toc:()=>s});var r=t(87462),a=(t(67294),t(3905));const o={sidebar_position:2},i="Examples",l={unversionedId:"Examples",id:"Examples",title:"Examples",description:"All Widgets",source:"@site/docs/Examples.md",sourceDirName:".",slug:"/Examples",permalink:"/EasyMacros/docs/Examples",draft:!1,editUrl:"https://github.com/brinkokevin/EasyMacros/edit/main/docs/Examples.md",tags:[],version:"current",sidebarPosition:2,frontMatter:{sidebar_position:2},sidebar:"defaultSidebar",previous:{title:"Introduction",permalink:"/EasyMacros/docs/intro"},next:{title:"How macros work",permalink:"/EasyMacros/docs/Render"}},c={},s=[{value:"All Widgets",id:"all-widgets",level:2},{value:"Load Character",id:"load-character",level:2},{value:"More Examples Coming Soon",id:"more-examples-coming-soon",level:2}],d={toc:s},u="wrapper";function p(e){let{components:n,...o}=e;return(0,a.kt)(u,(0,r.Z)({},d,o,{components:n,mdxType:"MDXLayout"}),(0,a.kt)("h1",{id:"examples"},"Examples"),(0,a.kt)("h2",{id:"all-widgets"},"All Widgets"),(0,a.kt)("p",null,"This macro demonstrates all the widgets available. If you would like to see more widgets added, feel free to open an issue or dm me on discord ",(0,a.kt)("inlineCode",{parentName:"p"},"@brinkokevin"),"."),(0,a.kt)("pre",null,(0,a.kt)("code",{parentName:"pre",className:"language-lua"},'local MacroTypes = require(game.ServerStorage.MacroTypes)\n\nlocal isChecked = false\nlocal function render(api: MacroTypes.api)\n    -- Simple label\n    api.label("Hello, World!")\n\n    -- Simple heading\n    api.heading("Hello, World!")\n\n    -- Heading with custom font\n    api.heading("Hello, World!", {\n        font = Font.fromName("Bangers", Enum.FontWeight.ExtraBold, Enum.FontStyle.Normal),\n    })\n    api.heading("Hello, World!", {\n        font = Enum.Font.ArimoBold,\n    })\n\n    -- Error message\n    api.error("Failed to execute macro!")\n\n    -- Button\n    local button = api.button("Hello, World!")\n    if button:clicked() then\n        print("Button was clicked!")\n    end\n\n    -- Uncontrolled checkbox\n    local checkbox = api.checkbox("Uncontrolled checkbox")\n    if checkbox:clicked() then\n        print("Checkbox was clicked, current state: " .. tostring(checkbox:getValue()))\n    end\n\n    -- Controlled checkbox\n    local controlledCheckbox = api.checkbox("Controlled checkbox", {\n        checked = isChecked,\n    })\n    if controlledCheckbox:clicked() then\n        isChecked = not isChecked\n        print("Controlled checkbox was clicked, current state: " .. tostring(isChecked))\n    end\n\n    -- Disabled checkbox\n    api.checkbox("Disabled checkbox", {\n        checked = isChecked,\n        disabled = true,\n    })\n\n    -- Simple Number input\n    local ageInput = api.numberinput("Age")\n    if ageInput:valueChanged() then\n        print("New age: " .. tostring(ageInput:getValue()))\n    end\n\n    -- Number input with constraints\n    local numberInput = api.numberinput("Radius", {\n        default = 30,\n        min = 0,\n        max = 100,\n    })\n    if numberInput:valueChanged() then\n        print("New value: " .. tostring(numberInput:getValue()))\n    end\n\n    -- String input with no default value\n    local stringInput = api.stringinput("String Input")\n    if stringInput:valueChanged() then\n        print("New string: " .. tostring(stringInput:getValue()))\n    end\n\n    -- String input with default value\n    local defaultStringInput = api.stringinput("String Input with default value", {\n        default = "Hello, World!",\n    })\n    if defaultStringInput:valueChanged() then\n        print("New string: " .. tostring(defaultStringInput:getValue()))\n    end\nend\n\nreturn {\n    title = "Example: All Widgets",\n    layoutOrder = 5,\n    render = render,\n}\n')),(0,a.kt)("p",null,(0,a.kt)("img",{alt:"All Widgets",src:t(66551).Z,width:"469",height:"1036"})),(0,a.kt)("h2",{id:"load-character"},"Load Character"),(0,a.kt)("p",null,"Load Character is a simple macro that loads a character into the workspace. It's a good example of how to use the ",(0,a.kt)("inlineCode",{parentName:"p"},"api")," object to create StringInput, Checkbox and a Button component."),(0,a.kt)("pre",null,(0,a.kt)("code",{parentName:"pre",className:"language-lua"},'-- MacroTypes provides the API types to luau, if you don\'t care about types you don\'t have to use it\nlocal MacroTypes = require(game.ServerStorage.MacroTypes)\n\n-- ChangeHistoryService is used to record changes in studio, this allows us to undo the changes we make\nlocal ChangeHistoryService = game:GetService("ChangeHistoryService")\nlocal Camera = workspace.CurrentCamera\n\n-- Insert Character is a helper function for our macro, it\'s not related to Easy Macros\nlocal function insertCharacter(username: string, isR6: boolean)\n    -- Start recording the changes we make to the workspace\n    local id = ChangeHistoryService:TryBeginRecording("LoadCharacter")\n\n    -- Get the userId of the player\n    local userId = game.Players:GetUserIdFromNameAsync(username)\n    -- Get the humanoid description of the player\n    local humanoidDescription = game.Players:GetHumanoidDescriptionFromUserId(userId)\n    -- Create a model from the humanoid description\n    local rigType = isR6 and Enum.HumanoidRigType.R6 or Enum.HumanoidRigType.R15\n    local model = game.Players:CreateHumanoidModelFromDescription(humanoidDescription, rigType)\n    model:PivotTo(CFrame.new((Camera.CFrame * CFrame.new(0, 0, -25)).Position))\n    model.Name = username\n    model.Parent = workspace\n\n    -- Finish recording the changes we made\n    if id then\n        ChangeHistoryService:FinishRecording(id, Enum.FinishRecordingOperation.Commit)\n    end\nend\n\n-- Render function is called every frame, it\'s where you define the UI components of your macro\nlocal function render(api: MacroTypes.api)\n    -- Render the UI components\n    local usernameInput = api.stringinput("Username", {\n        default = "brinkokevin",\n    })\n    local r6Checkbox = api.checkbox("Create R6 character")\n    local insertButton = api.button("Insert Character")\n\n    -- clicked is a function that returns true if the button was clicked\n    -- Once clicked is read, it resets to false until the button is clicked again\n    if insertButton:clicked() then\n        -- Get the values of the UI components\n        local username = usernameInput:getValue()\n        local isR6 = r6Checkbox:getValue()\n        -- We use task.spawn to avoid yielding the render function,\n        -- since loading the character can take a moment\n        -- and we are not allowed to yield inside the render function\n        task.spawn(insertCharacter, username or "brinkokevin", isR6)\n    end\nend\n\nreturn {\n    -- The title of the macro\n    title = "Example: Load Character",\n    -- The order in which the macro appears in the menu\n    layoutOrder = 2,\n    -- The function that defines the UI components of the macro\n    render = render,\n}\n')),(0,a.kt)("p",null,(0,a.kt)("img",{alt:"Load Character",src:t(65050).Z,width:"1033",height:"648"})),(0,a.kt)("h2",{id:"more-examples-coming-soon"},"More Examples Coming Soon"),(0,a.kt)("p",null,"If you have a macro you'd like to share, feel free to submit a pull request to add it to the documentation!\nIf you are not familiar with github, you can also dm me on discord ",(0,a.kt)("inlineCode",{parentName:"p"},"@brinkokevin")))}p.isMDXComponent=!0},65050:(e,n,t)=>{t.d(n,{Z:()=>r});const r=t.p+"assets/images/LoadCharacterView-1c8eedd1a01db4199ba80e254e7b786b.png"},66551:(e,n,t)=>{t.d(n,{Z:()=>r});const r=t.p+"assets/images/WidgetsView-7ee23a5632653ffed4527ae62ecb0eee.png"}}]);