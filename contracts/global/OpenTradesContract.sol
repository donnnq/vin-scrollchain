// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OpenTradesContract {
    struct TradeSite {
        string name;
        string location;
        bool isActive;
        uint256 lastUpdated;
        address initiator;
    }

    mapping(uint256 => TradeSite) public sites;
    uint256 public siteCount;

    event SiteActivated(uint256 indexed id, string name);
    event SiteUpdated(uint256 indexed id, string newLocation);

    function registerSite(string memory name, string memory location) public {
        sites[siteCount] = TradeSite(
            name,
            location,
            false,
            block.timestamp,
            msg.sender
        );
        siteCount++;
    }

    function activateSite(uint256 id) public {
        require(!sites[id].isActive, "Site already active");
        sites[id].isActive = true;
        sites[id].lastUpdated = block.timestamp;
        emit SiteActivated(id, sites[id].name);
    }

    function updateSiteLocation(uint256 id, string memory newLocation) public {
        sites[id].location = newLocation;
        sites[id].lastUpdated = block.timestamp;
        emit SiteUpdated(id, newLocation);
    }
}
