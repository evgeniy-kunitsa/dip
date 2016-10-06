# Цифровая обработка изображений
###1. Логические операции
Использование:
```ruby
require './logical_operations/image'

first_image | second_image #or
first_image & second_image #and
first_image ^ second_image #xor
!image #not
```
**OR**: 
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/logical_operations/4.jpg "OR")    
**AND**: 
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/logical_operations/3.jpg "AND")    
**XOR**: 
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/logical_operations/5.jpg "XOR")    
**NOT**: 
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/logical_operations/6.jpg "NOT")    

=================================

###2. Умножение и увеличение яркости на константу
Использование:

```ruby
require './add_mul_const/image'

i + 12358
image * 4
```
**Исходное**: 
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/add_mul_const/1.jpg "Source")

**Добавление**: 
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/add_mul_const/2.jpg "Add")

**Умножение**: 
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/add_mul_const/3.jpg "MUL")

=============================================

###3.Сложение и вычитание изображений

Использование:

```ruby
require './images_adder/image'

first_image + second_image
first_image - second_image
```
**Исходные**:  
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/images_adder/1.jpg "Source-1")
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/images_adder/2.jpg "Source-2")

**Сложение**:   
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/images_adder/3.jpg "ADD")

**Вычитание**: 
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/images_adder/4.jpg "SUB")

=============================================

###4.Маскирование

Использование:

```ruby
require './masking/image'

matrix = Matrix.build(i.rows, i.columns) { rand.round }.to_a

i * matrix
```
**Исходное**:  
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/masking/1.jpg "Source")

**Маскирование**:  
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/masking/2.jpg "Masking")


=============================================

###5.Эквализация

Использование:

```ruby
require './eq/image'

i.equalize
```
**Исходное**:  
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/eq/1.jpg "Source")

**Эквализированное**:  
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/eq/2.jpg "Masking")

=============================================

###6.Пилообразный яркостный срез

Использование:

```ruby
require './luminance_slice/image'

n = 2
imag.luminance_slice(n) #n - количество зубьев пилы
```
**Исходное**:  
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/luminance_slice/1.jpg "Source")

**После яркостного среза**:  
![alt text](https://raw.githubusercontent.com/evgeniy-kunitsa/dip/develop/luminance_slice/2.jpg "Masking")





