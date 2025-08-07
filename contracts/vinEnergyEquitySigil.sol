// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract vinEnergyEquitySigil {
    enum EnergyType { Oil, Gas, Solar, Hydro, Wind, Biomass }

    struct EnergyRecord {
        address contributor;
        EnergyType source;
        string location;
        uint256 energyOutputKWh;
        uint256 equityScore;
        uint256 timestamp;
    }

    EnergyRecord[] public records;
    mapping(address => uint256[]) public contributorToRecords;

    event EnergyLogged(
        address indexed contributor,
        EnergyType source,
        string location,
        uint256 energyOutputKWh,
        uint256 equityScore,
        uint256 timestamp
    );

    function logEnergy(
        EnergyType source,
        string memory location,
        uint256 energyOutputKWh,
        uint256 equityScore
    ) public {
        require(equityScore <= 100, "Max score is 100");
        EnergyRecord memory record = EnergyRecord({
            contributor: msg.sender,
            source: source,
            location: location,
            energyOutputKWh: energyOutputKWh,
            equityScore: equityScore,
            timestamp: block.timestamp
        });

        records.push(record);
        contributorToRecords[msg.sender].push(records.length - 1);

        emit EnergyLogged(msg.sender, source, location, energyOutputKWh, equityScore, block.timestamp);
    }

    function getMyEnergyRecords() public view returns (EnergyRecord[] memory) {
        uint256[] memory indexes = contributorToRecords[msg.sender];
        EnergyRecord[] memory result = new EnergyRecord[](indexes.length);

        for (uint256 i = 0; i < indexes.length; i++) {
            result[i] = records[indexes[i]];
        }

        return result;
    }

    function getTotalOutput(address contributor) public view returns (uint256 totalKWh) {
        uint256[] memory indexes = contributorToRecords[contributor];
        for (uint256 i = 0; i < indexes.length; i++) {
            totalKWh += records[indexes[i]].energyOutputKWh;
        }
    }
}
