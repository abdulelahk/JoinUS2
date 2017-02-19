import UIKit
import MapKit
import CoreLocation
import Firebase

class CreateEventViewController: UIViewController, CLLocationManagerDelegate,UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    
    @IBOutlet var imageButton: UIButton!

    @IBOutlet weak var Map: MKMapView!
    @IBOutlet var EventTime: UITextField!
    let datepicker = UIDatePicker()
     var categoryPicker : UIPickerView!
    
    @IBOutlet var EventName: UITextField!

    @IBOutlet var AvailableSeats: UITextField!
    
    @IBOutlet var EventDes: UITextView!
    
    @IBOutlet var category: UITextField!
    
    var categories = ["Sport","Programming","Business","Photography","Social","Other"]
    
    let imagePicker = UIImagePickerController()
    var selectedImage : UIImage?
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
        
        EventName.delegate = self
        createToolBar()
        self.imagePicker.delegate = self
       let DesTapped = UITapGestureRecognizer(target: self, action: Selector("clearDes"))
        EventDes.addGestureRecognizer(DesTapped)
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
      print("Touched!!")
            EventName.resignFirstResponder()
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        return false
    }
        func clearDes(){
            if EventDes.text == "Event Description."{
            EventDes.text = ""
        }
            EventDes.becomeFirstResponder()
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
        datepicker.minimumDate = Date()
        
        
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
    
    func createToolBar(){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let DoneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(donePressed))
        toolbar.setItems([DoneButton], animated: false)
        
        EventDes.inputAccessoryView = toolbar
        AvailableSeats.inputAccessoryView = toolbar
        
    }
    
    func donePressed(){
        
        self.view.endEditing(true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            selectedImage = pickedImage
            
        }
        
        picker.dismiss(animated: true) { 
            self.imageButton.setBackgroundImage(self.selectedImage, for: .normal)
        }
        
    }

 
    @IBAction func cameraIconTapped(_ sender: UIButton) {
        
        let Alert = UIAlertController(title: "Pick image", message: nil, preferredStyle: .actionSheet)
        
        let cameraAction = UIAlertAction(title: "From camera", style: .default) { (action) in

            self.imagePicker.sourceType = .camera
            self.imagePicker.allowsEditing = true
            self.imagePicker.showsCameraControls = true
            
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
       let libraryAction = UIAlertAction(title: "From library", style: .default) { (action) in
        
        self.imagePicker.sourceType = .photoLibrary
        self.imagePicker.allowsEditing = true
        
        
        self.present(self.imagePicker, animated: true, completion: nil)

        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        Alert.addAction(cameraAction)
        Alert.addAction(libraryAction)
        Alert.addAction(cancelAction)
 
 
        print(Alert.view.subviews.count)
        self.present(Alert, animated: true, completion: nil)
    }
    
    @IBAction func createEvent(_ sender: UIButton) {
    }
    
    
}

