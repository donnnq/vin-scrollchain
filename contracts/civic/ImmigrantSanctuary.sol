// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/// @title ImmigrantSanctuary - Grants free housing to verified, returning immigrants without legal issues
/// @author Vinvin
/// @notice Encodes eligibility, allocation, and sanctuary status

contract ImmigrantSanctuary {
    address public scrollsmith;

    struct Home {
        uint256 id;
        string location;
        bool isAllocated;
    }

    struct Resident {
        address immigrant;
        uint256 homeId;
        bool hasLegalIssues;
        bool isReturning;
        bool grantedSanctuary;
        uint256 timestamp;
    }

    uint256 public nextHomeId;
    mapping(uint256 => Home) public homes;
    mapping(address => Resident) public residents;
    address[] public sanctuaryList;

    event HomeGranted(address indexed immigrant, uint256 homeId, string location);

    modifier onlyScrollsmith() {
        require(msg.sender == scrollsmith, "Not authorized");
        _;
    }

    constructor() {
        scrollsmith = msg.sender;
    }

    /// @notice Add new homes to the sanctuary pool
    function addHome(string calldata location) external onlyScrollsmith {
        homes[nextHomeId] = Home(nextHomeId, location, false);
        nextHomeId++;
    }

    /// @notice Immigrant requests sanctuary housing
    function requestSanctuary(bool hasLegalIssues, bool isReturning) external {
        require(residents[msg.sender].grantedSanctuary == false, "Already granted");

        residents[msg.sender] = Resident(
            msg.sender,
            0,
            hasLegalIssues,
            isReturning,
            false,
            block.timestamp
        );
    }

    /// @notice Grant home if immigrant is eligible
    function grantSanctuary(address immigrant) external onlyScrollsmith {
        Resident storage res = residents[immigrant];
        require(!res.hasLegalIssues, "Legal issues disqualify");
        require(res.isReturning, "Must be returning immigrant");

        for (uint256 i = 0; i < nextHomeId; i++) {
            if (!homes[i].isAllocated) {
                homes[i].isAllocated = true;
                res.homeId = i;
                res.grantedSanctuary = true;
                sanctuaryList.push(immigrant);
                emit HomeGranted(immigrant, i, homes[i].location);
                return;
            }
        }

        revert("No available homes");
    }

    /// @notice View sanctuary recipients
    function getSanctuaryList() external view returns (address[] memory) {
        return sanctuaryList;
    }

    /// @notice View home details
    function getHome(uint256 homeId) external view returns (Home memory) {
        return homes[homeId];
    }

    /// @notice View resident details
    function getResident(address immigrant) external view returns (Resident memory) {
        return residents[immigrant];
    }
}
