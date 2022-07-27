## MVVM

### ViewModel: data presentation for the view
- Owns the model
- Does not own a View or a ViewController
- Completely UI-independent (aka should not import UIKit)
- When the model changes, viewModel will trigger an update in the view 
- Controller sets up the View binding for the ViewModel (via closure, delegation, or observables pattern)

### Easier Testing
- Testing a VC is difficult: lifecycle methods, autolayout, coupled with UI, view logic (button being tapped, swiping, view appearing) is combined with data logic
- Testing a VM is easier: no UI, only deals with data related logic

### Dependency Injection with VM
- Ex. ViewModel with a networking service object
- Production networking object can be replaced with mock networking object

### Model
- data layer
- data manipulation

### View
- renders visual
- send user interactations to controller

### Controller
- try to slim it down to behave just like a view
- responding to user interaction (IBAction)
- manage view, layouts, view hierachy
- navigation (will move to Coordinator)
- no data logic
- setting a binding: binds the view to the viewModel's propery (model)
