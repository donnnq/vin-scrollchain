// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract ProvinceSigil is Ownable {
    struct Sigil {
        string province;
        string glyph;
        uint8 autonomyLevel;
        string lore;
        bool minted;
    }

    mapping(address => Sigil) public sigils;
    address[] public citizens;
    event SigilMinted(address indexed citizen, string province, string glyph, uint8 autonomyLevel, string lore);

    function mintSigil(
        string memory _province,
        string memory _glyph,
        uint8 _autonomyLevel,
        string memory _lore
    ) external {
        require(!sigils[msg.sender].minted, "Already claimed");
        require(_autonomyLevel <= 100, "Invalid autonomy level");

        sigils[msg.sender] = Sigil(_province, _glyph, _autonomyLevel, _lore, true);
        citizens.push(msg.sender);
        emit SigilMinted(msg.sender, _province, _glyph, _autonomyLevel, _lore);
    }

    function viewSigil(address _citizen) external view returns (Sigil memory) {
        return sigils[_citizen];
    }

    function totalSigilsMinted() external view returns (uint256) {
        return citizens.length;
    }

    function renderSigil(address _citizen) external view returns (string memory) {
        Sigil memory s = sigils[_citizen];
        require(s.minted, "Sigil not minted");

        string memory color = s.autonomyLevel >= 75
            ? "#FF0000"
            : s.autonomyLevel >= 50
                ? "#FFA500"
                : "#008000";

        return string(abi.encodePacked(
            "<svg width='300' height='300' xmlns='http://www.w3.org/2000/svg'>",
            "<circle cx='150' cy='150' r='100' fill='", color, "' />",
            "<text x='50%' y='40%' dominant-baseline='middle' text-anchor='middle' font-size='20'>",
            s.province, "</text>",
            "<text x='50%' y='60%' dominant-baseline='middle' text-anchor='middle' font-size='16'>",
            s.glyph, "</text>",
            "<text x='50%' y='80%' dominant-baseline='middle' text-anchor='middle' font-size='12' fill='#333'>",
            s.lore, "</text></svg>"
        ));
    }
}
