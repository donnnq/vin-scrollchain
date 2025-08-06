// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinScrollChainEmotionVisualizer {
    struct EmotionAura {
        string mood;         // e.g. "hopeful", "tense", "joyful"
        string color;        // e.g. "#FFD700" for joy
        uint intensity;      // 0–100 scale
        string pulse;        // e.g. "slow", "rapid", "steady"
    }

    mapping(uint => EmotionAura) public auraMap;

    event EmotionAuraUpdated(uint indexed scrollId, string mood, string color, uint intensity, string pulse);
    event EmotionOverlaySVG(uint indexed scrollId, string svg);

    function setEmotionAura(
        uint scrollId,
        string memory mood,
        string memory color,
        uint intensity,
        string memory pulse
    ) public {
        auraMap[scrollId] = EmotionAura(mood, color, intensity, pulse);
        emit EmotionAuraUpdated(scrollId, mood, color, intensity, pulse);
    }

    function renderEmotionOverlay(uint scrollId) public view returns (string memory) {
        EmotionAura memory aura = auraMap[scrollId];
        string memory opacity = aura.intensity > 80 ? "0.9" : aura.intensity > 50 ? "0.6" : "0.3";

        return string(abi.encodePacked(
            "<svg xmlns='http://www.w3.org/2000/svg' width='100' height='100'>",
            "<rect width='100' height='100' fill='", aura.color, "' opacity='", opacity, "' />",
            "<text x='50%' y='90%' dominant-baseline='middle' text-anchor='middle' font-size='8' fill='white'>",
            aura.mood,
            "</text>",
            "</svg>"
        ));
    }

    function emitEmotionOverlay(uint scrollId) public {
        string memory svg = renderEmotionOverlay(scrollId);
        emit EmotionOverlaySVG(scrollId, svg);
    }
}
