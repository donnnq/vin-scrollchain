// Stores and deploys pledged funds for civic restoration, flood control, housing, and urgent urban projects

pragma mythic;

contract ScrollchainCivicFund {
    struct Pledge {
        string supporterName;
        string projectType;
        string recipientEntity;
        uint amount;
        string urgencyLevel;
        bool deployed;
    }

    Pledge[] public pledges;

    event PledgeCommitted(string supporter, string projectType, uint amount);
    event FundsDeployed(string recipient, uint amount);

    function commitPledge(
        string memory _supporter,
        string memory _projectType,
        string memory _recipient,
        uint _amount,
        string memory _urgency
    ) public {
        pledges.push(Pledge(_supporter, _projectType, _recipient, _amount, _urgency, false));
        emit PledgeCommitted(_supporter, _projectType, _amount);
    }

    function deployFunds(uint index) public {
        pledges[index].deployed = true;
        emit FundsDeployed(pledges[index].recipientEntity, pledges[index].amount);
    }

    function getPledge(uint index) public view returns (
        string memory, string memory, string memory, uint, string memory, bool
    ) {
        Pledge memory p = pledges[index];
        return (
            p.supporterName,
            p.projectType,
            p.recipientEntity,
            p.amount,
            p.urgencyLevel,
            p.deployed
        );
    }
}
