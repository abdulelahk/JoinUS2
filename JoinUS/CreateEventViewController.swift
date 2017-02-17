import UIKit
import MapKit
import CoreLocation

class CreateEventViewController: UIViewController, CLLocationManagerDelegate,UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var Map: MKMapView!
    @IBOutlet var EventTime: UITextField!
    let datepicker = UIDatePicker()
     var categoryPicker : UIPickerView!
    
    @IBOutlet var EventName: UITextField!

    @IBOutlet var AvailableSeats: UITextField!
    
    @IBOutlet var AgeLimitation: UITextField!
    
    @IBOutlet var EventLocation: UITextField!
    
    @IBOutlet var EventDes: UITextView!
    
    @IBOutlet var category: UITextField!
    
    var categories = ["Sport","Programming","Business","Photography","Social","Other"]
    
    
    
    //Map
    let maneger = CLLocationManager()
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let location = locations[0]
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.01 , 0.01)
        
        let myLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(location.coordinate.latitude, location.coordinate.longitude)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(myLocation, span)
        Map.setRegion(region, animated: true)
        
        
        self.Map.showsUserLocation = true
        
    }
    //!Map
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPicker = UIPickerView()
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        categoryPicker.showsSelectionIndicator = true
        categoryPicker.reloadAllComponents()
        createDatePicker()
        createCategoryPicker()
        //Map
        maneger.delegate = self
        maneger.desiredAccuracy = kCLLocationAccuracyBest
        maneger.requestAlwaysAuthorization()
        maneger.startUpdatingLocation()
        //!Map
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return categories.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return categories[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        category.text = categories[row]
        
    }
    
    func createCategoryPicker(){
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let DoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(categoryDonePressed))
        toolbar.setItems([DoneButton], animated: false)
        
        category.inputAccessoryView = toolbar
        category.inputView = categoryPicker

    }
    
    
    func categoryDonePressed(){
        category.resignFirstResponder()
    }
    
    func createDatePicker(){
        
        datepicker.datePickerMode = .dateAndTime
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let DoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(DateDonePressed))
        toolbar.setItems([DoneButton], animated: false)
        
        EventTime.inputAccessoryView = toolbar
        EventTime.inputView = datepicker
    }
    func DateDonePressed() {
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .short
        dateFormater.timeStyle = .short
        EventTime.text = dateFormater.string(from: datepicker.date)
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

 
    @IBAction func cameraIconTapped(_ sender: UIButton) {
    }
    
    @IBAction func createEvent(_ sender: UIButton) {
    }
    
    
}

