module raster_diamond(width, length, size=10, gap=2) {
    x_dia =  sqrt(pow(size, 2) + pow(size, 2));
    
    module diamond() {
        rotate([0, 0, 45]) square(size, center=true);
    }
    
    module half_diamond() {
        difference() {
            diamond();
            translate([0, (x_dia / 2) * -1]) square(x_dia);
        }
    }
    
    x_width = x_dia + gap;
    x_diamonds = width / x_width;
    y_diamonds = length / x_width;
    
    module diamond_row(count) {
        for(x = [0 : count]) {
            translate([x_width * x, 0, 0]) diamond();
        }
    }
    
    module raster() {
        for(y = [0 : (y_diamonds * 2)]) {
            translate([0, y * (x_width / 2)]) { 
                if (y % 2 == 0) {
                    diamond_row(x_diamonds + 1);
                } else {
                    translate([x_width / 2, 0, 0]) diamond_row(x_diamonds);
                }
            }
        }
    }
    
    module frame() {
        color("green") {
            difference() {
                offset(delta=20) square([width, length]);
                square([width, length]);
            }
        }
    }
    
    difference() {
        raster();
        frame();
    }
} 

raster_diamond(100, 100);