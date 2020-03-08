## 먼저 input vcf에서 header를 grep 하여 out.vcf에 저장합니다
grep "^#" in.vcf > out.vcf

## 그 다음 header를 제외한 vcf 부분에서 필드 구분자 -k에서 첫 번째 필드
## -k1에서 1번째 필드를 Version sort 하고,
## -k2에서 -n numeric sort 해줍니다.
grep -v "^#" in.vcf | sort -k1,1V -k2n >> out.vcf

## V 옵션을 넣지 않으면,
## chr10 다음 chr2가 오게 됩니다.
## n 옵션을 넣지 않으면,
## 숫자가 아닌 문자열로 정렬되어
## 122134 다음에 12345가 오게 됩니다
