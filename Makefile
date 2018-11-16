CXX = g++ -std=c++11  

MXNET = ~/src/mxnet
TVM = ~/src/tvm
 
MXNET_LIB = ${MXNET}/lib


LIBRARY = -L ${MXNET_LIB} \
-l boost_system \
-l protobuf \
-l boost_filesystem \
-l opencv_highgui \
-l opencv_imgcodecs \
-l opencv_imgproc \
-l opencv_core \
-l opencv_video \
-l opencv_videoio \
-l mxnet \
-l pthread

INCLUDE = -I ./ \
-I /usr/local/include \
-I ${MXNET}/include \
-I ${MXNET}/3rdparty/tvm/nnvm/include \
-I ${MXNET}/3rdparty/dmlc-core/include \
-I src 

DEPENDENCIES = src/cv.h \
	 src/cv.hh \
	 src/debug.h \
	 src/debug.hh \
	 src/file.h \
	 src/file.hh \
	 src/matrix.h \
	 src/matrix.hh \
	 src/mx.h \
	 src/mx/shape.h \
	 src/mx/shape.h \
	 src/mx/image.h \
	 src/mx/image.hh \
	 src/xml.h \
	 src/xml.hh \
	 src/stl.h \
	 src/stl.hh

flt: src/cv.h \
	 src/cv.hh \
	 src/debug.h \
	 src/debug.hh \
	 src/file.h \
	 src/file.hh \
	 src/matrix.h \
	 src/matrix.hh \
	 src/mx.h \
	 src/mx/layer.h \
	 src/mx/layer.hh \
	 src/mx/shape.h \
	 src/mx/shape.h \
	 src/mx/image.h \
	 src/mx/image.hh \
	 src/xml.h \
	 src/xml.hh \
	 src/stl.h \
	 src/stl.hh
 
	${CXX} -shared -fPIC ${DEPENDENCIES} ${LIBRARY} ${INCLUDE} -o libflt.so


main: main.cc detector.hh detector.h

	 ${CXX} main.cc ${LIBRARY} ${INCLUDE} -I include -o main -L . -l flt

