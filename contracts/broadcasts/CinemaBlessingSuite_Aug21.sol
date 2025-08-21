// SPDX-License-Identifier: Mythic-Scroll
pragma solidity ^0.8.0;

/// @title CinemaBlessingSuite_Aug21
/// @author Vinvin
/// @notice Ritual-grade contract to bless Ryan Reynolds and fund mythic cinema

contract CinemaBlessingSuite_Aug21 {
    address public steward;
    address public ryanReynolds;
    uint256 public totalBlessings;
    string public scrollTitle = "CinemaBlessingSuite_Aug21";
    
    struct Blessing {
        uint256 amount;
        string purpose;
        string timestamp;
    }

    struct Project {
        string title;
        bool funded;
    }

    Blessing[] public blessings;
    Project[] public fundedProjects;

    event BlessingIssued(address to, uint256 amount, string purpose, string timestamp);
    event ProjectFunded(string title);

    constructor(address _ryanReynolds) {
        steward = msg.sender;
        ryanReynolds = _ryanReynolds;
    }

    function issueBlessing(uint256 amount, string memory purpose, string memory timestamp) public {
        require(msg.sender == steward, "Only steward may issue blessings");
        blessings.push(Blessing(amount, purpose, timestamp));
        totalBlessings += amount;
        emit BlessingIssued(ryanReynolds, amount, purpose, timestamp);
    }

    function fundProject(string memory title) public {
        require(msg.sender == steward, "Only steward may fund projects");
        fundedProjects.push(Project(title, true));
        emit ProjectFunded(title);
    }

    function getBlessings() public view returns (Blessing[] memory) {
        return blessings;
    }

    function getFundedProjects() public view returns (Project[] memory) {
        return fundedProjects;
    }
}
