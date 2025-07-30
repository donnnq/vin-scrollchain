// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vinPublicEduCast {
    address public scrollsmith;
    uint public schoolCount;

    struct SchoolTV {
        string schoolName;
        string region;
        bool isUpgraded;
        string broadcastPurpose;
    }

    mapping(uint => SchoolTV) public eduCastScroll;
    
    event SchoolUpgraded(string schoolName, string region, string broadcastPurpose);
    event ScrollsmithTransferred(address oldScrollsmith, address newScrollsmith);

    constructor() {
        scrollsmith = msg.sender;
    }

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Only scrollsmith can cast upgrades.");
        _;
    }

    // Enshrine a school for TV-based teaching
    function upgradeSchoolTV(
        string memory schoolName,
        string memory region,
        string memory broadcastPurpose
    ) public onlyScrollsmith {
        eduCastScroll[schoolCount++] = SchoolTV(schoolName, region, true, broadcastPurpose);
        emit SchoolUpgraded(schoolName, region, broadcastPurpose);
    }

    // View school info
    function getSchoolTV(uint id) public view returns (
        string memory schoolName,
        string memory region,
        bool isUpgraded,
        string memory broadcastPurpose
    ) {
        SchoolTV memory s = eduCastScroll[id];
        return (s.schoolName, s.region, s.isUpgraded, s.broadcastPurpose);
    }

    // Transfer scrollsmith role
    function transferScrollsmith(address newScrollsmith) public onlyScrollsmith {
        require(newScrollsmith != address(0), "Invalid address.");
        emit ScrollsmithTransferred(scrollsmith, newScrollsmith);
        scrollsmith = newScrollsmith;
    }

    // Get total upgraded schools
    function totalUpgrades() public view returns (uint) {
        return schoolCount;
    }
}
