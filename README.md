# widget_generator

生成模板化的Flutter代码

## Getting Started

通过使用类注解的方式，直接生成注解对应的Flutter代码模板，包括常用的ListView、GridView等，生成后只需完善判断方法，以及item的构建就可直接使用，不用重复编写代码，大大缩短了对于一些重复度较高页面编写的时间。
主要应用了Flutter中build_runner和source_gen。通过继承GeneratorForAnnotation重写generateForAnnotatedElement方法，返回需要的模板内容。并配置对应的builder，设置需要引入的文件，指定builder，并配置生成代码的后缀以及扩展名。
在需要的类上使用该注解，通过build_runner命令   
`flutter packages pub run build_runner build`   

即可自动生成对应的代码模板。

