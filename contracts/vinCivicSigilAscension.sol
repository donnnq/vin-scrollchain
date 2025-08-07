pragma solidity ^0.8.0;

contract vinCivicSigilAscension {
    address public steward;

    struct Ascension {
        address worker;
        string name;
        string prestigeTitle;
        uint256 yearsServed;
        uint256 timeGranted;
    }

    mapping(address => Ascension[]) public ascensionLogs;

    event AscensionGranted(address indexed worker, string prestigeTitle, uint256 yearsServed);

    function grantAscension(
        address _worker,
        string memory _name,
        string memory _prestigeTitle,
        uint256 _yearsServed
    ) public {
        require(msg.sender == steward, "Only steward");

        ascensionLogs[_worker].push(Ascension(
            _worker, _name, _prestigeTitle, _yearsServed, block.timestamp
        ));

        emit AscensionGranted(_worker, _prestigeTitle, _yearsServed);
    }

    function viewAscensions(address _worker) public view returns (Ascension[] memory) {
        return ascensionLogs[_worker];
    }
}
