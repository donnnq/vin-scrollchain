// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract vinCivicVow {
    struct Vow {
        string name;
        string vowText;
        uint256 timestamp;
        bool isBound;
    }

    mapping(address => Vow) public civicVows;

    event VowEncoded(address indexed worker, string vowText);

    function encodeVow(address worker, string memory name, string memory vowText) public {
        require(!civicVows[worker].isBound, "Vow already bound.");
        civicVows[worker] = Vow(name, vowText, block.timestamp, true);
        emit VowEncoded(worker, vowText);
    }

    function getVow(address worker) public view returns (string memory, string memory, uint256) {
        Vow memory v = civicVows[worker];
        return (v.name, v.vowText, v.timestamp);
    }
}
