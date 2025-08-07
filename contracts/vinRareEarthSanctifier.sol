// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

interface InfraTracker {
    function logProject(string memory, string memory, string memory, bool) external;
}

interface DomainGuard {
    function toggleExtraction(string memory, bool) external;
}

interface YieldOracle {
    function updateYield(string memory, string memory, uint256) external;
}

contract vinRareEarthSanctifier {
    address public sanctifier;
    InfraTracker public infraTracker;
    DomainGuard public domainGuard;
    YieldOracle public yieldOracle;

    modifier onlySanctifier() {
        require(msg.sender == sanctifier, "Unauthorized");
        _;
    }

    constructor(
        address _sanctifier,
        address _infraTracker,
        address _domainGuard,
        address _yieldOracle
    ) {
        sanctifier = _sanctifier;
        infraTracker = InfraTracker(_infraTracker);
        domainGuard = DomainGuard(_domainGuard);
        yieldOracle = YieldOracle(_yieldOracle);
    }

    function sanctifyProject(
        string memory projectName,
        string memory location,
        string memory partnerCountry,
        bool operational,
        string memory tribalRegion,
        bool extractionAllowed,
        string memory mineName,
        uint256 estimatedREEKg
    ) external onlySanctifier {
        infraTracker.logProject(projectName, location, partnerCountry, operational);
        domainGuard.toggleExtraction(tribalRegion, extractionAllowed);
        yieldOracle.updateYield(mineName, location, estimatedREEKg);
    }
}
