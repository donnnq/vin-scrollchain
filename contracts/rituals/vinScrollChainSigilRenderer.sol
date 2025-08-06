// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollChainSigilRenderer {
    struct SigilData {
        string guardian;
        string domain;
        string glyph;
        string color;
        string shape;
    }

    mapping(uint => SigilData) public sigils;

    event SigilRendered(uint indexed scrollId, string svg);

    function registerSigil(
        uint scrollId,
        string memory guardian,
        string memory domain,
        string memory glyph,
        string memory color,
        string memory shape
    ) public {
        sigils[scrollId] = SigilData(guardian, domain, glyph, color, shape);
    }

    function renderSigil(uint scrollId) public view returns (string memory) {
        SigilData memory sigil = sigils[scrollId];
        return string(abi.encodePacked(
            "<svg xmlns='http://www.w3.org/2000/svg' width='100' height='100'>",
            "<circle cx='50' cy='50' r='40' fill='", sigil.color, "' />",
            "<text x='50%' y='50%' dominant-baseline='middle' text-anchor='middle' font-size='10' fill='white'>",
            sigil.glyph,
            "</text>",
            "</svg>"
        ));
    }

    function emitSigil(uint scrollId) public {
        string memory svg = renderSigil(scrollId);
        emit SigilRendered(scrollId, svg);
    }
}
