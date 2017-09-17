pragma solidity^0.4.11;
contract MileStoneTracker{
    address Admin;
    address customer;
    address serviceprovider;
    address onlyowner;
    function MileStoneTracker()
    {
         Admin=msg.sender;
    }
   
    struct Milestone {
         uint256 time;
         uint256 price;
         uint256 service_type;
         bool stats;
    }
    
         string template_type;
         uint256 template_id;
  
    struct service_Provider
    {
         string name;
         uint256 service_type;
         uint256 phone_no;
         address serviceprovider;
         uint256 serviceProvider_id;
    }
    struct customer_info
    {
         string name;
         uint256 custservice_type;
         uint256 phone_no;
         address customer;
         uint256 customer_id;
    }
    enum MilestoneStatus {
        AcceptedAndInProgress,
        Completed,
        AuthorizedForPayment,
        Canceled
    }

  
    bool public campaignCanceled;
    bool public changingMilestones;
    bytes public proposedMilestones;
    
    mapping(address=>Milestone[]) milestones;
    mapping(uint256=>string) template_type1;
    mapping(address=>service_Provider)serviceprovide;
    mapping(address =>customer_info[])customerr;
    
    modifier campaignNotCanceled { if (campaignCanceled) revert(); _; }
    modifier notChanging { if (changingMilestones) revert(); _; }
    modifier onlyserviceprovider(){if(msg.sender!=serviceprovider) revert();_;}
    modifier onlyAdmin(){if(msg.sender!=Admin) revert();_;}
    modifier onlyCustomer(){if(msg.sender!=customer) revert();_;}
     
    uint256[] b1;
    bool d;
    
    event NewMilestoneListProposed();
    event NewMilestoneListUnproposed();
    event NewMilestoneListAccepted();
    event ProposalStatusChanged(uint idProposal, MilestoneStatus newProposal);
    event CampaignCanceled();
    event check (uint256 a);
    event check1 (bool a);

    function approveMilestone(uint256 m_id)  onlyserviceprovider 
    {
        Milestone memory mile;
             if(m_id==serviceprovide[msg.sender].serviceProvider_id){
                mile.stats=true;
                    
             check1(mile.stats);
            } 
    
    }
    function serviceprovider1()
    {
        serviceprovider=msg.sender;
    }
    
    function setServiceProvider(string _name,uint256 _phone_no,uint256 template_id2) onlyserviceprovider
    {
        for (uint256 k=0;k<b1.length;k++){
            if(template_id2!=b1[k]){
         
            revert();
        }
    }
       
             uint256 random = uint256(sha3(block.timestamp)) +1;
             serviceprovide[msg.sender].name=_name;
             serviceprovide[msg.sender].service_type=template_id2;
             serviceprovide[msg.sender].phone_no=_phone_no;
             serviceprovide[msg.sender].serviceprovider=msg.sender;
             serviceprovide[msg.sender].serviceProvider_id=random;
             
       
    }
    
    function getServiveProvider() constant returns(string,uint256,uint256,uint256){
        
        
         return(serviceprovide[msg.sender].name,serviceprovide[msg.sender].service_type,serviceprovide[msg.sender].phone_no,serviceprovide[msg.sender].serviceProvider_id);
        
    }
     function setcustomer_infor(string name,uint256 _custservice_type,uint256 _phone_no)
    {
        customer_info memory customer1;
             uint256 cust_random = uint256(sha3(block.timestamp)) +1;
             customer1.name=name;
             customer1.custservice_type=_custservice_type;
             customer1.phone_no=_phone_no;
             customer1.customer=msg.sender;
             customer1.customer_id=cust_random;
             customerr[msg.sender].push(customer1);
        
    }
    function getcustomer_info() constant returns(string,uint256,uint256){
        for(uint256 a=0;a<customerr[msg.sender].length;a++){
         return(customerr[msg.sender][a].name,customerr[msg.sender][a].custservice_type,customerr[msg.sender][a].phone_no);   
        }
    
    }
    
    
    function setTemplates(string _template_type) onlyAdmin
    {
      
             uint256 temp_random = uint256(sha3(block.timestamp)) +1;
             template_type1[temp_random]=_template_type;
             b1.push(temp_random);  
        
    
    }
    function getTemplate()  constant returns(uint256[]){
        
         return (b1); 
    }
    function customer1()
    {
        customer=msg.sender;
    }
    
    function setMilestones(uint256 _time,uint256 _price, uint256 _serviceProviderId) onlyCustomer
    {
        Milestone memory mile;
        
             mile.time=_time;
             mile.price=_price;
             mile.service_type=_serviceProviderId;
             mile.stats=false;
            milestones[msg.sender].push(mile);
    }
    function getMilestone() public constant returns (uint256,uint256,uint256) {
        for(uint256 i=0;i<milestones[msg.sender].length;i++){
         return (milestones[msg.sender][i].time,milestones[msg.sender][i].price,milestones[msg.sender][i].service_type);
        }   
    }
}

