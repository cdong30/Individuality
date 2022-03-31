class Individual {
  Gene chromosome[];
  int value[];
  RegularGon phenotype;
  float fitness;
  int SIDES_GENE_LENGTH = 5;
  int sides = 5;
  int radius = 6;
  int spinRate = 3;
  int redColor = 8;
  int greenColor = 8;
  int blueColor = 8;

  Individual(Boolean randInd) {
    chromosome = new Gene[6];
    value = new int [6];
    if (randInd == true) {
      chromosome[0] = new Gene(sides);
      chromosome[1] = new Gene(radius);
      chromosome[2] = new Gene(spinRate);
      chromosome[3] = new Gene(redColor);
      chromosome[4] = new Gene(blueColor);
      chromosome[5] = new Gene(greenColor);
      setPhenotype();
    }
  }

  void setPhenotype() {
    int sidez = chromosome[0].getValue();
    int radii = chromosome[1].getValue();
    float spinner = (float) chromosome[2].getValue();
    color colorz = color(chromosome[3].getValue(), chromosome[4].getValue(), chromosome[5].getValue());
    phenotype = new RegularGon(sidez, radii, spinner, colorz);
  }

  void mutate(float rate) {
    float threshold = random(0.0, 1.0);
    for (int i = 0; i < chromosome.length; i++) {
      if (threshold < rate) { 
        chromosome[i].mutate();
      }
    }
  }
  
  String toString(){
    String holder = "";
    for(int i = 0; i < chromosome.length; i++){
      holder += chromosome[i].toString() +  "\n";
    }
    return holder;
  }
  
  void display(int x, int y, boolean showFitness){
    phenotype.display(x, y);
    if(showFitness == true){
      text("fitness", x, y);
    }
  }
}
