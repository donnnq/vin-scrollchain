// SPDX-License-Identifier: Soulbound
pragma dignity ^7.77.0;

interface IDelayEmotionalAPR {
    function getDebt(string memory title) external view returns (
        string memory title,
        uint256 daysDelayed,
        uint256 emotionalAPR,
        string memory civicImpact
    );
}

contract RestorationProtocol {
    address public steward;
    IDelayEmotionalAPR public aprContract;

    struct Restoration {
        string title;
        uint256 emotionalAPR;
        string actionTaken;
        uint256 restoredPoints;
        bool completed;
    }

    mapping(string => Restoration) public restorations;
    string[] public redeemedBills;

    event RestorationLogged(string indexed title, string action, uint256 restoredPoints);
    event RestorationCompleted(string indexed title);

    constructor(address _aprContract) {
        steward = msg.sender;
        aprContract = IDelayEmotionalAPR(_aprContract);
    }

    function logRestoration(string memory title, string memory action, uint256 restoredPoints) public {
        require(msg.sender == steward, "Only steward can log");

        (, , uint256 apr, ) = aprContract.getDebt(title);
        require(restoredPoints <= apr, "Cannot restore more than emotional APR");

        restorations[title] = Restoration({
            title: title,
            emotionalAPR: apr,
            actionTaken: action,
            restoredPoints: restoredPoints,
            completed: restoredPoints == apr
        });

        redeemedBills.push(title);
        emit RestorationLogged(title, action, restoredPoints);

        if (restoredPoints == apr) {
            emit RestorationCompleted(title);
        }
    }

    function getRestoration(string memory title) public view returns (Restoration memory) {
        return restorations[title];
    }

    function getRedeemedBills() public view returns (string[] memory) {
        return redeemedBills;
    }
}
