// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

interface ISkillGlyph {
    function getGlyphsByOwner(address owner) external view returns (uint256[] memory);
}

interface IHubPulse {
    function getCenterStatus(string calldata location) external view returns (uint8);
}

interface IJobBridge {
    function getJob(uint256 jobId) external view returns (
        string memory, string memory, string memory, string memory, address, bool
    );
}

contract ScrollCircuit {
    address public scrollsmith;
    ISkillGlyph public skillGlyph;
    IHubPulse public hubPulse;
    IJobBridge public jobBridge;

    event RitualSynced(address indexed trainee, string location, bool statusOk, bool certified, bool jobsAvailable);

    constructor(address _glyph, address _hub, address _bridge) {
        scrollsmith = msg.sender;
        skillGlyph = ISkillGlyph(_glyph);
        hubPulse = IHubPulse(_hub);
        jobBridge = IJobBridge(_bridge);
    }

    /// Ritual sync: verify status of trainee, center & job prospects
    function ritualSync(address trainee, string calldata location, uint256 jobId) external view returns (bool statusOk, bool certified, bool jobsAvailable) {
        // Check certification
        uint256[] memory glyphs = skillGlyph.getGlyphsByOwner(trainee);
        certified = glyphs.length > 0;

        // Check hub status (2 = Thriving)
        statusOk = hubPulse.getCenterStatus(location) == 2;

        // Check job match
        (, , , , , bool isOpen) = jobBridge.getJob(jobId);
        jobsAvailable = isOpen;

        return (statusOk, certified, jobsAvailable);
    }
}
