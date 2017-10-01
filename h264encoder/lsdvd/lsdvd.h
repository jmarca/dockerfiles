#ifndef _LSDVD_H_
#define _LSDVD_H_

extern char *video_format[2];
extern char *aspect_ratio[4];
extern char *quantization[4];
extern char *mpeg_version[2];
extern char *video_height[4];
extern char *video_width[4];
extern char *permitted_df[4];
extern char *audio_format[7];
extern int audio_id[7];
extern char *sample_freq[2];
extern char *audio_type[5];
extern char *subp_type[16];
extern double frames_per_s[4];
extern char *program_name;

extern int opt_a, opt_c, opt_n, opt_p, opt_q;
extern int opt_s, opt_t, opt_v, opt_x, opt_d, opt_P;
extern char opt_O;

typedef struct {
	int hour;
	int minute;
	int second;
	int usec;
} playback_time_t;

struct dvd_info {
	struct {
		char *device;
		char *disc_title;
		char *vmg_id;
		char *provider_id;
	} discinfo;
	int title_count;
	struct {
		int enabled;
		struct {
			float length;
			playback_time_t playback_time;
			char *vts_id;
		} general;
		struct {
			int vts;
			int ttn;
			float fps;
			char *format;
			char *aspect;
			char *width;
			char *height;
			char *df;
		} parameter;
		int angle_count; /* no real angle detail is available... but hey. */
		int audiostream_count_reported; /* This includes all audio streams, active or not */
		int audiostream_count; /* The real value of active audio streams */
		struct {
			char *langcode;
			char *language;
			char *format;
			char *frequency;
			char *quantization;
			int channels;
			int ap_mode;
			char *content;
			int streamid;
		} *audiostreams;
		int chapter_count_reported; /* This value is sometimes wrong */
		int chapter_count; /* This value is real */
		struct {
			float length;
			playback_time_t playback_time;
			int startcell;
		} *chapters;
		int cell_count;
		struct {
			float length;
			playback_time_t playback_time;
		        int first_sector;
		        int last_sector;
		} *cells;
		int subtitle_count_reported; /* This includes all subtitle streams, active or not */
		int subtitle_count; /* The real value of active subtitle streams */
		struct {
			char *langcode;
			char *language;
			char *content;
			int streamid;
		} *subtitles;
		int *palette;
	} *titles;
	int longest_track;
};

void ohuman_print(struct dvd_info *dvd_info);
void operl_print(struct dvd_info *dvd_info);
void oruby_print(struct dvd_info *dvd_info);
void oxml_print(struct dvd_info *dvd_info);

#endif /* _LSDVD_H_ */
