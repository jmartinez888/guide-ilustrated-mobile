int buildMultiGrids(double width) {
  return width <= 320
      ? 1
      : width <= 640
          ? 2
          : width <= 768
              ? 3
              : width <= 1024
                  ? 4
                  : width <= 1280
                      ? 5
                      : width <= 1536
                          ? 6
                          : 7;
}

/* double buildHeightGrids(double height) {
  return height <= 320 ? 0.5 : height <= 500 ? 0.6 : height <= 525 ? 0.6 : height <= 550 ? 0.625 : height <= 600 ? 0.65 : height <= 640 ? 0.7 : height <= 680 ? 0.5 : height <= 700 ? 0.52 : height <= 725 ? 0.575 : height <= 740 ? 0.585 : height <= 768 ? 0.59 : height <= 768 ? 0.5 : height <= 800 ? 0.4625 : height <= 850? 0.485 : height <= 900 ? 0.525 : height <= 925 ? 0.525 : height <= 950 ? 0.55 : height <= 1000 ? 0.5875 : height <= 1024 ? 0.5875 : 0.5;
} */

