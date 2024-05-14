
function append(arr, value) {
     arr2 = newArray(arr.length+1);
     for (i=0; i<arr.length; i++)
        arr2[i] = arr[i];
     arr2[arr.length] = value;
     return arr2;
  }

// function to measure the area of the ellipse drawn;
function measure(string){
	setTool("elliptical");
	waitForUser("Draw an ellipse then click ok", string);
	run("Measure");
}

open(); // starts dialog to choose the image to open;
filename = File.nameWithoutExtension;
// tells what kind of measurements to make;
run("Set Measurements...", " area display redirect=None decimal=3");

// make empty arrays;
filenamearray = newArray();
earlarray = newArray();
headlarray = newArray();

//assign filename and location to their arrays;
filenamearray = append(filenamearray, filename);

// Run the measuring function for each dimension you want;
measure("select the ear");
earlarray = append(earlarray, getResult("Area", nResults-1));

measure("select the head ");
headlarray = append(headlarray, getResult("Area", nResults-1));

// list the results;
Array.show(filenamearray, earlarray, headlarray);

saveAs("Results","RabbitAreas.csv");
close("*");
