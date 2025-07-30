// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/// @title vinSigilBeacon.sol
/// @notice Establishes protective civic beacons over historically significant zones.

contract vinSigilBeacon {
    address public scrollsmith;
    uint public sigilCount;

    struct SigilZone {
        string zoneName;
        address location;
        string memoryVerse;
        bool activeProtection;
        uint timestamp;
    }

    mapping(uint => SigilZone) public sigilRegistry;

    event SigilCast(string zoneName, address indexed location, string memoryVerse);
    event ProtectionActivated(address indexed zone);
    event ProtectionRevoked(address indexed zone);
    event ScrollsmithTransferred(address oldScrollsmith, address newScrollsmith);

    constructor() {
        scrollsmith = msg.sender;
        sigilCount = 0;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized scrollsmith");
        _;
    }

    function castSigil(
        string memory zoneName,
        address location,
        string memory memoryVerse,
        bool activeProtection
    ) public onlyScrollsmith {
        sigilRegistry[sigilCount++] = SigilZone(
            zoneName,
            location,
            memoryVerse,
            activeProtection,
            block.timestamp
        );
        emit SigilCast(zoneName, location, memoryVerse);
        if (activeProtection) {
            emit ProtectionActivated(location);
        }
    }

    function activateProtection(uint id) public onlyScrollsmith {
        require(id < sigilCount, "Invalid sigil ID");
        sigilRegistry[id].activeProtection = true;
        emit ProtectionActivated(sigilRegistry[id].location);
    }

    function revokeProtection(uint id) public onlyScrollsmith {
        require(id < sigilCount, "Invalid sigil ID");
        sigilRegistry[id].activeProtection = false;
        emit ProtectionRevoked(sigilRegistry[id].location);
    }

    function getSigil(uint id) public view returns (
        string memory zoneName,
        address location,
        string memory memoryVerse,
        bool activeProtection,
        uint timestamp
    ) {
        SigilZone memory s = sigilRegistry[id];
        return (s.zoneName, s.location, s.memoryVerse, s.activeProtection, s.timestamp);
    }

    function transferScrollsmith(address newScrollsmith) public onlyScrollsmith {
        require(newScrollsmith != address(0), "Invalid scrollsmith address");
        emit ScrollsmithTransferred(scrollsmith, newScrollsmith);
        scrollsmith = newScrollsmith;
    }

    function totalSigils() public view returns (uint) {
        return sigilCount;
    }
}
