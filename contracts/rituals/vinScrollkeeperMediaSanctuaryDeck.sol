// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinScrollkeeperMediaSanctuaryDeck {
    address public scrollkeeper;

    struct MediaSanctuary {
        string country;
        string outletName;
        string language;
        bool verified;
        uint256 timestamp;
    }

    MediaSanctuary[] public sanctuaries;

    event SanctuaryRegistered(string outletName, string country);

    modifier onlyScrollkeeper() {
        require(msg.sender == scrollkeeper, "Not authorized");
        _;
    }

    constructor() {
        scrollkeeper = msg.sender;
    }

    function registerSanctuary(string memory country, string memory outletName, string memory language) external onlyScrollkeeper {
        sanctuaries.push(MediaSanctuary(country, outletName, language, false, block.timestamp));
        emit SanctuaryRegistered(outletName, country);
    }

    function verifySanctuary(uint256 index) external onlyScrollkeeper {
        sanctuaries[index].verified = true;
    }

    function getSanctuary(uint256 index) external view returns (string memory, string memory, string memory, bool, uint256) {
        MediaSanctuary memory m = sanctuaries[index];
        return (m.country, m.outletName, m.language, m.verified, m.timestamp);
    }

    function totalSanctuaries() external view returns (uint256) {
        return sanctuaries.length;
    }
}
