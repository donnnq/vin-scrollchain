pragma solidity ^0.8.0;

contract RecruitmentCeremony {
    struct Ceremony {
        address recruit;
        string barangay;
        string vow;
        bool completed;
        uint256 timestamp;
    }

    Ceremony[] public ceremonies;

    event CeremonyStarted(address indexed recruit, string barangay);
    event CeremonyCompleted(address indexed recruit, string vow);

    function startCeremony(address recruit, string memory barangay) public {
        ceremonies.push(Ceremony(recruit, barangay, "", false, block.timestamp));
        emit CeremonyStarted(recruit, barangay);
    }

    function completeCeremony(uint256 index, string memory vow) public {
        ceremonies[index].vow = vow;
        ceremonies[index].completed = true;
        emit CeremonyCompleted(ceremonies[index].recruit, vow);
    }

    function getCeremony(uint256 index) public view returns (Ceremony memory) {
        return ceremonies[index];
    }

    function totalCeremonies() public view returns (uint256) {
        return ceremonies.length;
    }
}
