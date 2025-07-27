// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinTowerExpansion {
    address public oracle;
    uint256 public expansionRound;

    struct Zone {
        string barangayName;
        uint256 totalUnits;
        uint256 availableUnits;
        bool active;
    }

    mapping(uint256 => Zone) public zones;
    mapping(address => uint256) public residentZone;
    event ZoneAdded(uint256 indexed zoneId, string barangayName);
    event ResidentAssigned(address indexed resident, uint256 zoneId);

    modifier onlyOracle() {
        require(msg.sender == oracle, "Access denied: not scroll-authorized.");
        _;
    }

    constructor() {
        oracle = msg.sender;
        expansionRound = 1;
    }

    function addZone(string memory _barangayName, uint256 _totalUnits) public onlyOracle {
        zones[expansionRound] = Zone(_barangayName, _totalUnits, _totalUnits, true);
        emit ZoneAdded(expansionRound, _barangayName);
        expansionRound += 1;
    }

    function assignResident(address _resident, uint256 _zoneId) public onlyOracle {
        Zone storage z = zones[_zoneId];
        require(z.active, "Zone inactive: ritual paused.");
        require(z.availableUnits > 0, "No units left: initiate empathy protocol.");

        residentZone[_resident] = _zoneId;
        z.availableUnits -= 1;
        emit ResidentAssigned(_resident, _zoneId);
    }

    function getZoneInfo(uint256 _zoneId) public view returns (string memory, uint256, uint256, bool) {
        Zone memory z = zones[_zoneId];
        return (z.barangayName, z.totalUnits, z.availableUnits, z.active);
    }
}
