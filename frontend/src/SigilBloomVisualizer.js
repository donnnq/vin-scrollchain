import React, { useEffect, useState } from 'react';
import { ethers } from 'ethers';
import bloomAbi from './abis/vin_scrollSigilBloom.json';

export default function SigilBloomVisualizer({ contractAddress }) {
  const [glyphs, setGlyphs] = useState([]);

  useEffect(() => {
    const provider = new ethers.providers.WebSocketProvider(process.env.REACT_APP_WS_URL);
    const contract = new ethers.Contract(contractAddress, bloomAbi, provider);

    contract.on('SigilBloomed', (id, glyph, ts) => {
      setGlyphs((prev) => [...prev, { id, glyph, ts }]);
      // auto-remove after 5s
      setTimeout(() => {
        setGlyphs((p) => p.filter((g) => g.id !== id));
      }, 5000);
    });

    return () => provider.removeAllListeners();
  }, [contractAddress]);

  return (
    <div className="bloom-container">
      {glyphs.map(({ id, glyph }) => (
        <div key={id} className="sigil-bloom">
          <span>{glyph}</span>
        </div>
      ))}
    </div>
  );
}
