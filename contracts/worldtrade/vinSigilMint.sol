// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinSigilMint {
    address public scrollMaster;

    struct Sigil {
        uint8 month;
        string regionName;
        string archetype; // e.g. “AgriPulse”, “SaaSForge”, “TeaSpiral”
        string imageHash; // Optional IPFS/Arweave link
        uint256 mintedAt;
        address summonedBy;
    }

    Sigil[] public sigils;
    mapping(uint8 => bool) public monthMinted;

    event SigilForged(uint8 indexed month, string regionName, string archetype, address indexed summonedBy);

    modifier onlyScrollMaster() {
        require(msg.sender == scrollMaster, "Not scroll master");
        _;
    }

    constructor() {
        scrollMaster = msg.sender;
    }

    function forgeSigil(
        uint8 month,
        string memory regionName,
        string memory archetype,
        string memory imageHash
    ) public onlyScrollMaster {
        require(month >= 1 && month <= 12, "Invalid month");
        require(!monthMinted[month], "Sigil already minted for this month");

        sigils.push(Sigil(month, regionName, archetype, imageHash, block.timestamp, msg.sender));
        monthMinted[month] = true;

        emit SigilForged(month, regionName, archetype, msg.sender);
    }

    function summonSigil(uint256 index) external view returns (Sigil memory) {
        require(index < sigils.length, "Out of bounds");
        return sigils[index];
    }

    function totalSigilsMinted() external view returns (uint256) {
        return sigils.length;
    }
}
