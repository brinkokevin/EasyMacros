"use strict";(self.webpackChunkdocs=self.webpackChunkdocs||[]).push([[63],{3905:(e,t,n)=>{n.d(t,{Zo:()=>p,kt:()=>f});var r=n(67294);function l(e,t,n){return t in e?Object.defineProperty(e,t,{value:n,enumerable:!0,configurable:!0,writable:!0}):e[t]=n,e}function a(e,t){var n=Object.keys(e);if(Object.getOwnPropertySymbols){var r=Object.getOwnPropertySymbols(e);t&&(r=r.filter((function(t){return Object.getOwnPropertyDescriptor(e,t).enumerable}))),n.push.apply(n,r)}return n}function i(e){for(var t=1;t<arguments.length;t++){var n=null!=arguments[t]?arguments[t]:{};t%2?a(Object(n),!0).forEach((function(t){l(e,t,n[t])})):Object.getOwnPropertyDescriptors?Object.defineProperties(e,Object.getOwnPropertyDescriptors(n)):a(Object(n)).forEach((function(t){Object.defineProperty(e,t,Object.getOwnPropertyDescriptor(n,t))}))}return e}function o(e,t){if(null==e)return{};var n,r,l=function(e,t){if(null==e)return{};var n,r,l={},a=Object.keys(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||(l[n]=e[n]);return l}(e,t);if(Object.getOwnPropertySymbols){var a=Object.getOwnPropertySymbols(e);for(r=0;r<a.length;r++)n=a[r],t.indexOf(n)>=0||Object.prototype.propertyIsEnumerable.call(e,n)&&(l[n]=e[n])}return l}var c=r.createContext({}),u=function(e){var t=r.useContext(c),n=t;return e&&(n="function"==typeof e?e(t):i(i({},t),e)),n},p=function(e){var t=u(e.components);return r.createElement(c.Provider,{value:t},e.children)},s="mdxType",m={inlineCode:"code",wrapper:function(e){var t=e.children;return r.createElement(r.Fragment,{},t)}},d=r.forwardRef((function(e,t){var n=e.components,l=e.mdxType,a=e.originalType,c=e.parentName,p=o(e,["components","mdxType","originalType","parentName"]),s=u(n),d=l,f=s["".concat(c,".").concat(d)]||s[d]||m[d]||a;return n?r.createElement(f,i(i({ref:t},p),{},{components:n})):r.createElement(f,i({ref:t},p))}));function f(e,t){var n=arguments,l=t&&t.mdxType;if("string"==typeof e||l){var a=n.length,i=new Array(a);i[0]=d;var o={};for(var c in t)hasOwnProperty.call(t,c)&&(o[c]=t[c]);o.originalType=e,o[s]="string"==typeof e?e:l,i[1]=o;for(var u=2;u<a;u++)i[u]=n[u];return r.createElement.apply(null,i)}return r.createElement.apply(null,n)}d.displayName="MDXCreateElement"},47282:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>c,contentTitle:()=>i,default:()=>m,frontMatter:()=>a,metadata:()=>o,toc:()=>u});var r=n(87462),l=(n(67294),n(3905));const a={},i="Getting Started",o={unversionedId:"GettingStarted",id:"GettingStarted",title:"Getting Started",description:"Installing the plugin",source:"@site/docs/GettingStarted.md",sourceDirName:".",slug:"/GettingStarted",permalink:"/EasyMacros/docs/GettingStarted",draft:!1,editUrl:"https://github.com/brinkokevin/EasyMacros/edit/main/docs/GettingStarted.md",tags:[],version:"current",frontMatter:{},sidebar:"defaultSidebar",previous:{title:"Custom Widgets",permalink:"/EasyMacros/docs/CustomWidgets"}},c={},u=[{value:"Installing the plugin",id:"installing-the-plugin",level:2},{value:"Using the plugin",id:"using-the-plugin",level:2},{value:"Creating a new macro",id:"creating-a-new-macro",level:2},{value:"Macro Template",id:"macro-template",level:2}],p={toc:u},s="wrapper";function m(e){let{components:t,...a}=e;return(0,l.kt)(s,(0,r.Z)({},p,a,{components:t,mdxType:"MDXLayout"}),(0,l.kt)("h1",{id:"getting-started"},"Getting Started"),(0,l.kt)("h2",{id:"installing-the-plugin"},"Installing the plugin"),(0,l.kt)("p",null,"To install the plugin, you need to first purchase it on the Roblox Creator Store."),(0,l.kt)("ol",null,(0,l.kt)("li",{parentName:"ol"},"Get the ",(0,l.kt)("a",{parentName:"li",href:"https://create.roblox.com/store/asset/17228863039"},"Easy Macros Plugin")," on the Roblox Creator Store."),(0,l.kt)("li",{parentName:"ol"},"Open Roblox Studio and install the plugin.")),(0,l.kt)("h2",{id:"using-the-plugin"},"Using the plugin"),(0,l.kt)("p",null,'"The plugin provides you with two buttons in the Plugins tab of Roblox Studio.'),(0,l.kt)("p",null,(0,l.kt)("img",{alt:"Plugin Tab",src:n(34023).Z,width:"185",height:"133"})),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},"Open Menu - Toggles the main menu of the plugin."),(0,l.kt)("li",{parentName:"ul"},"Create Template - Creates a new ",(0,l.kt)("inlineCode",{parentName:"li"},"Template.macro")," ModuleScript.")),(0,l.kt)("h2",{id:"creating-a-new-macro"},"Creating a new macro"),(0,l.kt)("p",null,"To create a macro, first create a new ModuleScript and name it with the ",(0,l.kt)("inlineCode",{parentName:"p"},".macro")," suffix, like ",(0,l.kt)("inlineCode",{parentName:"p"},"MyMacro.macro"),". Alternatively, you can use the ",(0,l.kt)("inlineCode",{parentName:"p"},"Create Template")," button in the Plugins tab to make a new macro."),(0,l.kt)("h2",{id:"macro-template"},"Macro Template"),(0,l.kt)("p",null,"Here is a basic macro template. Each macro module must return a table with the following fields:"),(0,l.kt)("ul",null,(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("inlineCode",{parentName:"li"},"title"),": The title of the macro"),(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("inlineCode",{parentName:"li"},"layoutOrder"),": The order in which the macro appears in the menu"),(0,l.kt)("li",{parentName:"ul"},(0,l.kt)("inlineCode",{parentName:"li"},"render"),": The function that defines the UI components of the macro")),(0,l.kt)("pre",null,(0,l.kt)("code",{parentName:"pre",className:"language-lua"},'return {\n    title = "My Macro",\n    layoutOrder = 1,\n    render = function(api)\n        -- Your macro code here\n    end\n}\n')))}m.isMDXComponent=!0},34023:(e,t,n)=>{n.d(t,{Z:()=>r});const r="data:image/png;base64,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"}}]);