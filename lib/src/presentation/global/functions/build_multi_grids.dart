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
