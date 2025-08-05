pragma solidity ^0.8.0;

contract vinJobUnityForceV2 {
    address public steward;
    uint256 public freeMealCredits = 3;
    uint256 public maxInstallment = 6;

    struct Applicant {
        address applicant;
        bool registered;
        bool sssComplete;
        bool philHealthComplete;
        bool tinComplete;
        uint8 mealCreditsUsed;
        bool toolsProvided;
        bool uniformProvided;
        uint256 totalDeduction;
        uint256 deductionPerMonth;
    }

    mapping(address => Applicant) public applications;

    event AutoRegistered(address indexed applicant, string[] verifiedSystems);
    event MealProvided(address indexed applicant, uint256 mealNumber);
    event EssentialsIssued(address indexed applicant, string[] items);
    event DeductionSetup(address indexed applicant, uint256 monthlyAmount);

    constructor() {
        steward = msg.sender;
    }

    function registerApplicant(address _applicant) public {
        require(!applications[_applicant].registered, "Already registered");

        applications[_applicant] = Applicant(
            _applicant, true, true, true, true, 0, false, false, 0, 0
        );

        string[] memory systems = new string[](3);
        systems[0] = "SSS";
        systems[1] = "PhilHealth";
        systems[2] = "TIN";

        emit AutoRegistered(_applicant, systems);
    }

    function issueEssentials(address _applicant, uint256 cost) public {
        require(applications[_applicant].registered, "Not registered");

        applications[_applicant].toolsProvided = true;
        applications[_applicant].uniformProvided = true;
        applications[_applicant].totalDeduction = cost;
        applications[_applicant].deductionPerMonth = cost / maxInstallment;

        string[] memory items = new string[](2);
        items[0] = "Tools";
        items[1] = "Uniform";

        emit EssentialsIssued(_applicant, items);
        emit DeductionSetup(_applicant, applications[_applicant].deductionPerMonth);
    }

    function provideMeal(address _applicant) public {
        require(applications[_applicant].registered, "Not registered");
        require(applications[_applicant].mealCreditsUsed < freeMealCredits, "Meal limit reached");

        applications[_applicant].mealCreditsUsed += 1;
        emit MealProvided(_applicant, applications[_applicant].mealCreditsUsed);
    }

    function viewApplication(address _applicant) public view returns (Applicant memory) {
        return applications[_applicant];
    }
}
