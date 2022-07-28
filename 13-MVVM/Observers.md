## Observers Patterns

### Property Observers
- property observer, triggers a block of code when there is a new asignment
- can be used to update views when there's new data
- can only observe stored properties you create

### KVO: Key Value Observing
- can observe properties from other classes (ex. webView's property)

### Notification Center
- send notification to observers that had subscribed to the notification
- One-to-many communication
- Compared with Delegation Pattern: One-to-one communication


### For Later
- SwiftUI version of Observables: ObservedObject, Published, Pushlisers, Binding, etc.
