	package it.gds.beans;

	public class Siti {
		private long id;
		private String description;
		private String ext_description;
		private String images_dir;
		private boolean franchisee;
		private String dbname;
		private Boolean centralized;
		private Boolean carouselized;
		private boolean active;
		private String url_name;
		private String site_meta_description;
		private String site_meta_author;
		private String site_meta_copyright;
		private String site_meta_keywords;

		public Siti() {

		}

		public long getId() {
			return id;
		}

		public void setId(long id) {
			this.id = id;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public String getExt_description() {
			return ext_description;
		}

		public void setExt_description(String ext_description) {
			this.ext_description = ext_description;
		}

		public String getImages_dir() {
			return images_dir;
		}

		public void setImages_dir(String images_dir) {
			this.images_dir = images_dir;
		}

		public boolean isFranchisee() {
			return franchisee;
		}

		public void setFranchisee(boolean franchisee) {
			this.franchisee = franchisee;
		}

		public String getDbname() {
			return dbname;
		}

		public void setDbname(String dbname) {
			this.dbname = dbname;
		}

		public Boolean getCentralized() {
			return centralized;
		}

		public void setCentralized(Boolean centralized) {
			this.centralized = centralized;
		}

		public Boolean getCarouselized() {
			return carouselized;
		}

		public void setCarouselized(Boolean carouselized) {
			this.carouselized = carouselized;
		}

		public boolean isActive() {
			return active;
		}

		public void setActive(boolean active) {
			this.active = active;
		}

		public String getUrl_name() {
			return url_name;
		}

		public void setUrl_name(String url_name) {
			this.url_name = url_name;
		}

		public String getSite_meta_description() {
			return site_meta_description;
		}

		public void setSite_meta_description(String site_meta_description) {
			this.site_meta_description = site_meta_description;
		}

		public String getSite_meta_author() {
			return site_meta_author;
		}

		public void setSite_meta_author(String site_meta_author) {
			this.site_meta_author = site_meta_author;
		}

		public String getSite_meta_copyright() {
			return site_meta_copyright;
		}

		public void setSite_meta_copyright(String site_meta_copyright) {
			this.site_meta_copyright = site_meta_copyright;
		}

		public String getSite_meta_keywords() {
			return site_meta_keywords;
		}

		public void setSite_meta_keywords(String site_meta_keywords) {
			this.site_meta_keywords = site_meta_keywords;
		}
	}
