mkdir -p IDR
mkdir -p IDR/logs

idr --samples MACS3/W18HA_0h_1_peaks.narrowPeak MACS3/W18HA_0h_2_peaks.narrowPeak \
--input-file-type narrowPeak \
--rank p.value \
--output-file IDR/W18HA_0h \
--plot \
--log-output-file IDR/logs/W18HA_0h.log

idr --samples MACS3/W18HA_2h_1_peaks.narrowPeak MACS3/W18HA_2h_2_peaks.narrowPeak \
--input-file-type narrowPeak \
--rank p.value \
--output-file IDR/W18HA_2h \
--plot \
--log-output-file IDR/W18HA_2h.idr.log

idr --samples MACS3/W33HA_0h_1_peaks.narrowPeak MACS3/W33HA_0h_2_peaks.narrowPeak \
--input-file-type narrowPeak \
--rank p.value \
--output-file IDR/W33HA_0h \
--plot \
--log-output-file IDR/logs/W33HA_0h.log

idr --samples MACS3/W33HA_2h_1_peaks.narrowPeak MACS3/W33HA_2h_2_peaks.narrowPeak \
--input-file-type narrowPeak \
--rank p.value \
--output-file IDR/W33HA_2h \
--plot \
--log-output-file IDR/logs/W33HA_2h.log

idr --samples MACS3/W40HA_0h_1_peaks.narrowPeak MACS3/W40HA_0h_2_peaks.narrowPeak \
--input-file-type narrowPeak \
--rank p.value \
--output-file IDR/W40HA_0h \
--plot \
--log-output-file IDR/logs/W40HA_0h.log

idr --samples MACS3/W40HA_2h_1_peaks.narrowPeak MACS3/W40HA_2h_2_peaks.narrowPeak \
--input-file-type narrowPeak \
--rank p.value \
--output-file IDR/W40HA_2h \
--plot \
--log-output-file IDR/logs/W40HA_2h.log
