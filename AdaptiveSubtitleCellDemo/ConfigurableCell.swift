/// Allow cells to config themselves via a model object
protocol ConfigurableCell {
    func config(withItem item: Any)
}
