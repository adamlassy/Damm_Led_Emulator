class Beam {

    int iSize;
    int iStartIndex;
    int iEndIndex;

    float fBright;
    float fLife;
    float fSpeed;

    //float fDecay;

    float fMaxBright;
    int iMaxSize;
    int bDirection;

    //boolean bAlive;
    boolean bMove;
 
    float fTargetDim;
    float fDim;
    float fEasingIn, fEasingOut;
    
    //beam(5, 1, 0, NUMPIXELS)

    Beam(int _size, float _speed, float _easing, int _dir, int _index, int _maxSize)
    {

      iSize = _size;
      fSpeed = _speed; 
      iStartIndex = _index;
      iMaxSize = _maxSize;

      iEndIndex = (_index+_size) % _maxSize;

      fMaxBright = 1;
      //fLife = 1;
      fBright = 1;
      
      bDirection = _dir;
      //fDecay = _decay; //.001;
      //bAlive = true;
      
      bMove = true;
      
      fTargetDim = 1;
      fEasingIn = _easing; //.015;
      fEasingOut = 1.35 * fEasingIn;
      fDim = 0;
    }

    boolean move()
    {
      //iIndex = (iIndex+1) % iMaxSize;
      
      if (bMove)
      {
        fBright += fSpeed;

        if (fBright >= fMaxBright) {
        
          iStartIndex = iStartIndex + bDirection;
          if (iStartIndex < 0) iStartIndex = iMaxSize - 1;
 
          iStartIndex = iStartIndex % iMaxSize;
          iEndIndex = (iStartIndex + iSize) % iMaxSize;
  
          fBright -= fMaxBright;
        }
      }
      
      //fLife -= fDecay;
      //fDim = 1 - (2 * abs(fLife-.5));

      //fDim += (fTargetDim - fDim) * fEasing;
      
      if (fTargetDim == 1)
      {
        if (fDim > .95) {
          fDim = 1;
          fTargetDim = 0;
        } else {
          fDim += (fTargetDim - fDim) * fEasingIn;
        }
      } else {

        if (fDim < .05) {
          return false;
        } else {
          fDim += (fTargetDim - fDim) * fEasingOut;
        }
      }

      //println(fDim);
      return true;
      
      /*
      if (fDim >= 1) {
        return false;
      } else {
        return true;
      }
      */
 
    }

    float getVal(int _index)
    {
      //Serial.println(_index);
      float _tBright;
 
      if (
        (iStartIndex < iEndIndex && (_index >= iStartIndex && _index <= iEndIndex))
        ||
        (iEndIndex < iStartIndex && (_index >= iStartIndex || _index <= iEndIndex))
      )
      {

        if (_index == iStartIndex) {

          _tBright = (bDirection > 0) ? 1-fBright : fBright;

        } else if (_index == iEndIndex) {

          _tBright = (bDirection > 0) ? fBright : 1-fBright;

        } else {
 
          _tBright = fMaxBright;
        }

        return _tBright * fDim;

      } else {

        return 0;
      }

    }

};