
/**
 * Binds data to components and provides interfaces.
 */
export class HomeViewModel{

  /**
   * Get swiper image data.
   *
   * @return {Array<Resource>} swiperImages.
   */
  getSwiperImages(): Array<Resource> {
    let swiperImages: Resource[] = [
    $r('app.media.fig1'),
    $r('app.media.fig2'),
    $r('app.media.fig3'),
    ];
    return swiperImages;
  }
}

export default new HomeViewModel();