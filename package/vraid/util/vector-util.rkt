#lang typed/racket

(provide (all-defined-out))

(require "../types.rkt"
         math/flonum)

(: vector-index (All (A) (A (Vectorof A) -> integer)))
(define (vector-index e v)
  (let ([m (vector-member e v)])
    (if (false? m)
        (vector-length v)
        m)))

(: build-vector-ref (All (A) (Natural (integer -> A) -> (integer -> A))))
(define (build-vector-ref count f)
  (let ([v (build-vector count f)])
    (lambda: ([n : integer])
      (vector-ref v n))))

(: build-flvector-ref (Natural (integer -> Flonum) -> (integer -> Flonum)))
(define (build-flvector-ref count f)
  (let ([v (build-flvector count f)])
    (lambda: ([n : integer])
      (flvector-ref v n))))

(: vector-take-at-most (All (A) ((Vectorof A) Integer -> (Vectorof A))))
(define (vector-take-at-most vec n)
  (vector-take vec (min n (vector-length vec))))
