<?php

namespace AppBundle\Controller;

use AppBundle\Entity\Node;
use AppBundle\Entity\Point;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        $points = $this->getDoctrine()->getRepository(Point\Poi::class)->findAll();

        // replace this example code with whatever you need
        return $this->render('@App/index.html.twig', ['points'=>$points]);
    }
}
