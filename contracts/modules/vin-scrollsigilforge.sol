// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollSigilForge {
    struct Sigil {
        string name;
        string glyph;
        string source; // e.g. "Relic", "Rite", "Omen"
        string origin;
        string effect;
        address bearer;
        bool active;
        uint256 timestamp;
    }

    Sigil[] public sigils;
    mapping(string => uint256) public nameToId;
    address public immutable forgeMaster;

    event SigilForged(uint256 indexed id, string name, string glyph, address bearer, string source, string origin, uint256 timestamp);
    event SigilRevoked(uint256 indexed id, uint256 timestamp);

    modifier onlyMaster() {
        require(msg.sender == forgeMaster, "Not the forge master");
        _;
    }

    constructor() {
        forgeMaster = msg.sender;
    }

    function forgeSigil(
        string calldata name,
        string calldata glyph,
        string calldata source,
        string calldata origin,
        string calldata effect,
        address bearer
    ) external onlyMaster {
        require(nameToId[name] == 0, "Sigil already exists");

        sigils.push(Sigil({
            name: name,
            glyph: glyph,
            source: source,
            origin: origin,
            effect: effect,
            bearer: bearer,
            active: true,
            timestamp: block.timestamp
        }));

        nameToId[name] = sigils.length;
        emit SigilForged(sigils.length - 1, name, glyph, bearer, source, origin, block.timestamp);
    }

    function revokeSigil(uint256 id) external onlyMaster {
        require(id < sigils.length, "Invalid sigil ID");
        sigils[id].active = false;
        emit SigilRevoked(id, block.timestamp);
    }

    function getSigil(uint256 id) external view returns (Sigil memory) {
        require(id < sigils.length, "Invalid sigil ID");
        return sigils[id];
    }

    function totalSigils() external view returns (uint256) {
        return sigils.length;
    }
}
