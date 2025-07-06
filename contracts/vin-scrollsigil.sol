// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract VinScrollSigil {
    struct Sigil {
        string name;
        string effect;
        string alignment;
        address bearer;
        bool active;
        uint256 timestamp;
    }

    Sigil[] public sigils;
    address public immutable sigilMaster;

    event SigilForged(uint256 indexed id, string name, string effect, string alignment);
    event SigilBound(uint256 indexed id, address indexed bearer);
    event SigilRevoked(uint256 indexed id, address indexed bearer);

    modifier onlyMaster() {
        require(msg.sender == sigilMaster, "Not the sigil master");
        _;
    }

    constructor() {
        sigilMaster = msg.sender;
    }

    function forgeSigil(string calldata name, string calldata effect, string calldata alignment) external onlyMaster {
        sigils.push(Sigil({
            name: name,
            effect: effect,
            alignment: alignment,
            bearer: address(0),
            active: false,
            timestamp: block.timestamp
        }));

        emit SigilForged(sigils.length - 1, name, effect, alignment);
    }

    function bindSigil(uint256 id, address bearer) external onlyMaster {
        require(id < sigils.length, "Invalid sigil");
        Sigil storage s = sigils[id];
        s.bearer = bearer;
        s.active = true;
        emit SigilBound(id, bearer);
    }

    function revokeSigil(uint256 id) external onlyMaster {
        require(id < sigils.length, "Invalid sigil");
        Sigil storage s = sigils[id];
        address previous = s.bearer;
        s.bearer = address(0);
        s.active = false;
        emit SigilRevoked(id, previous);
    }

    function getSigil(uint256 id) external view returns (Sigil memory) {
        require(id < sigils.length, "Invalid sigil");
        return sigils[id];
    }

    function totalSigils() external view returns (uint256) {
        return sigils.length;
    }
}
