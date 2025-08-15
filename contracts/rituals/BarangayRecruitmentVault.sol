pragma solidity ^0.8.0;

contract BarangayRecruitmentVault {
    struct Legend {
        string name;
        string barangay;
        string impact;
        uint256 timestamp;
    }

    Legend[] public legends;

    event LegendImmortalized(string name, string barangay, string impact);

    function immortalizeLegend(string memory name, string memory barangay, string memory impact) public {
        legends.push(Legend(name, barangay, impact, block.timestamp));
        emit LegendImmortalized(name, barangay, impact);
    }

    function getLegend(uint256 index) public view returns (Legend memory) {
        return legends[index];
    }

    function totalLegends() public view returns (uint256) {
        return legends.length;
    }
}
