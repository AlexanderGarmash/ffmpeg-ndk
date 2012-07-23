#include <libavformat/avformat.h>
#include <libavformat/avio.h>
#include <libavcodec/avcodec.h>
#include <libavfilter/avfilter.h>
#include <libswscale/swscale.h>
#include <libavutil/base64.h>
#include <libavutil/intfloat.h>
#include <libavutil/parseutils.h>

#include <libavutil/pixfmt.h>
#include <libavutil/avconfig.h>
#include <libavutil/avutil.h>
#include <libavutil/dict.h>

#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <stdint.h>

uint8_t buffer[1024];

int main(int argc, char *argv[]){
	av_register_all();
	enum CodecID code=CODEC_ID_MPEG2VIDEO;
	printf("CodecID is %d.\n", code);
	
	AVIOContext *avcc=NULL;
	avio_close(avcc);
	AVPicture *ap=NULL;
	avpicture_free(ap);
	
	AVFilterLink *afl=NULL;
	
	char *in="this is a test string.";
	int in_size=strlen(in);
	int out_size=AV_BASE64_SIZE(in_size);
	char out[out_size];
	av_base64_encode(out,out_size, in, in_size);
	
	SwsVector *sv=sws_getConstVec(123.0f, 64);
	
}